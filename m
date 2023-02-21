Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3706447ejb;
        Tue, 21 Feb 2023 15:18:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8oIg9ZJ559vGdnwTCJagIBxon6PFsP8FU8o0Rf4XAojfbMIZaQuO2wGRZMK52BwI3KRick
X-Received: by 2002:ad4:5aa7:0:b0:56b:ec14:e2b1 with SMTP id u7-20020ad45aa7000000b0056bec14e2b1mr14272573qvg.35.1677021539438;
        Tue, 21 Feb 2023 15:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677021539; cv=none;
        d=google.com; s=arc-20160816;
        b=q9l+hxH2JwWIyG4svh9ktk1dJrcoFf8YqkoxNlirzij490E2HXMmZxWV0kCDp7x+Un
         ajwIumkmuNAgP/tKx4m9QjhDvzrCNgWg16MTxUelkn033KkjIFRStx4kn0PjCp4VkexQ
         bH+hvXE+sQDpAVPY2FHMIprRWrvvHGUwWvOAW/DPLWtKIQJTW55gcCw4oCtFlvVNIhtc
         jsWpZv7716Lj/taIh9/FzOyuCjVQQjCVQFtYcqs5TjF0pVBjsw5hRaxat+Qnd2+iI4tP
         n1ScQDInDgNfVSqXWC1R7eznftOC+7y+g45s7ChHV0PwEydQWlAgZaujkna03a49pIUP
         +0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=m99AVCmKq/73W9WrWc7DiDDbrV1dMYs1a4Goma3qdbw=;
        b=eRgm/ppcqGynIKONGzlUPl8pZSMR1KW5f18DIDP/KrK4nLzDM/VdpeUxdI+cqy7h86
         lOyvnhm7vgztvUc29SlcDs1XKpOjGCm68vdnZDxXtVce7mBrbzNN1zb7VQ8bkjdyaEMo
         z3GPTYYnzfPFrYMUOQfhuvoXJd5hWW04IwbIp6tNjxXYX/+JbvCQXXCFl4+sjx2tRjKS
         4ldCVn4o0pKExoR3MPPKjozFlmp5zeZX3Y6yQJD3YRqKGxK5UFHa0nSHzAP5Z6P1LE2S
         tKCQmkOitlepLLwsJYfehxrWxXQC35NukNEuAwn3e9J/ULt1t1GgS20EWJCZOffFZ5Mz
         jO4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VGFS0e56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020a0cdd86000000b005351bc2cf4fsi12722262qvk.535.2023.02.21.15.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 15:18:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VGFS0e56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUbuG-0001gG-8q; Tue, 21 Feb 2023 18:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUbuD-0001g2-Rm
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:18:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUbu8-0000mq-Lm
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 18:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677021515;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m99AVCmKq/73W9WrWc7DiDDbrV1dMYs1a4Goma3qdbw=;
 b=VGFS0e56KA2ig6baWCQXc82Bes+HMYwBG963awnQG1cu0Y0JNtSjFRkw4y9ZnYHLDF6lL4
 OmEY+ftwUxA+jzbaJ4ELpElwl9PzRsMtTFYcDdKdyysxtwRcNv9liNgpg87aQBZ59sR5So
 s6W+x/AapXR9SXyABs9y1pt5pxYR+HE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-SZGoPstDNIWmQz4A688RjQ-1; Tue, 21 Feb 2023 18:18:34 -0500
X-MC-Unique: SZGoPstDNIWmQz4A688RjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9C27811E9C;
 Tue, 21 Feb 2023 23:18:33 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A88A91121314;
 Tue, 21 Feb 2023 23:18:23 +0000 (UTC)
Subject: Re: [PATCH v1 1/6] linux-headers: Update for dirty ring
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-2-gshan@redhat.com>
 <CAFEAcA9OvObRT731oaF7kOo8z32nH+egXfDcOpw1nHormHsp9A@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <2a13c5ba-e20a-ae96-3efd-1f7e2d224eff@redhat.com>
Date: Wed, 22 Feb 2023 10:18:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9OvObRT731oaF7kOo8z32nH+egXfDcOpw1nHormHsp9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kwV0vPdLxjYo

On 2/22/23 3:30 AM, Peter Maydell wrote:
> On Mon, 13 Feb 2023 at 00:39, Gavin Shan <gshan@redhat.com> wrote:
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   linux-headers/asm-arm64/kvm.h | 1 +
>>   linux-headers/linux/kvm.h     | 2 ++
>>   2 files changed, 3 insertions(+)
> 
> For this to be a non-RFC patch, this needs to be a proper
> sync of the headers against an upstream kernel tree.
> (By-hand tweaks are fine for purposes of working on
> and getting patchsets reviewed.)
> 

Yes, I vaguely remember there is script to synchronize linux header files,
which is './scripts/update-linux-headers.sh'. I think I need to run the
following command to update?

   # ./scripts/update-linux-headers.sh <LINUX_PATH> <QEMU_PATH>

Thanks,
Gavin

