Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1781123lfr;
        Tue, 6 Apr 2021 12:50:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx02KgoVsMQuKrR0xKmY2LcIGn9Z+8Q1vbCf5MvtpVDiglVF4WlYI47eZ8YJgFvRiwu0dkw
X-Received: by 2002:a02:3712:: with SMTP id r18mr30348316jar.11.1617738646005;
        Tue, 06 Apr 2021 12:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617738646; cv=none;
        d=google.com; s=arc-20160816;
        b=Icc1IdQXydgERp3zFbhDCpAo45mIVQsjIGix6CRzHsPBGoCSiQBY8iq8BZ5NQD5hmh
         qZbxeZTnvxfGs86okJWhMLHiGdb9ylFCzfxXVLI3GXwMg79xViYtl+be2azGcymClOM8
         w4lXSgodoWINRgaTJ94XUsjPPFY5UED3DgeuXmYhxIpKdNsIFXg2ZpfDCUgpQuSc6bfd
         jHvMpqRM5KRVC7elLtW8+gyB9RhoEbvbin3kEpiOaaIvuXMHAPZ5KjpkPAxWuFqNi7oM
         u9WyXbmi2v42MoHmWoOkW9rFOEdIYtAhdlsI3djYgqFhG/zUCyFNAxhhtn2HlL+NNeG2
         NZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IwXi4YcOEAKGazLQA3byH7dp7D0fOvM2TaNNgCctHMs=;
        b=waLBzJ7OAzzaVkZHIM6DCex9V+wALk8ARYh2QfjmKGfYix9nheb8IPMVZl3aoJ8/YA
         UsNbs41eK4Fp4/8qzXb5CPvvv22GI2TxL3uRuCfEeix83h/XDFzfFBVJjxwT9GcBdhw/
         UCYUA4o1BPyws2lEPy6XIo5E9N2jIV8OqG3ucz+eZrGpA17fDCOLg6V6+sNBhl2H/xDJ
         UGc9am5RMJzpAj/xnvX/eUErmb4Dp6YTdGMSDsXyDQb1/UqT43Q0GVV+g18zNXaOckpk
         L+vlciyKhnPcJH3IrP5z3ARbum/vD3fmdh2gYZlwVFvahZKw+WhkqEXOvGvfJ/FvVme3
         Hm+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HBETfj5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si18387616jal.37.2021.04.06.12.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 12:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HBETfj5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTrim-0005Jk-UG
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 15:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTriY-0005JS-5Z
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 15:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTriR-0002GA-7e
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 15:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617738622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwXi4YcOEAKGazLQA3byH7dp7D0fOvM2TaNNgCctHMs=;
 b=HBETfj5umILHInWQgcII/w/O4tz95g5m7wt6mHasa3WyxD+ahENVNO2rBkdYCAF6bnTB/P
 Bu0m/grZppGIb1W+ODZQ+Ngpy2Ce7I7M6kP1M/rJSbC97eD7FpnWcoTz7PppFz5rza8fm4
 jnQqLBfP5H96ls40BHAWANBC1a1NQEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-36vQgmmpPZydiYJ701kr8w-1; Tue, 06 Apr 2021 15:50:19 -0400
X-MC-Unique: 36vQgmmpPZydiYJ701kr8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 243038189CD;
 Tue,  6 Apr 2021 19:50:17 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7537B10023AC;
 Tue,  6 Apr 2021 19:50:13 +0000 (UTC)
Subject: Re: A question about the translation granule size supported by the
 vSMMU
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Prem Mallappa <prem.mallappa@broadcom.com>,
 Peter Maydell <peter.maydell@linaro.org>, linuc.decode@gmail.com
References: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4886d8d0-cca6-d4b2-4139-29ad52020f79@redhat.com>
Date: Tue, 6 Apr 2021 21:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7O5cAKF7IAVZ

Hi Kunkun,

On 3/27/21 3:24 AM, Kunkun Jiang wrote:
> Hi all,
> 
> Recently, I did some tests on SMMU nested mode. Here is
> a question about the translation granule size supported by
> vSMMU.
> 
> There is such a code in SMMUv3_init_regs():
> 
>>    /* 4K and 64K granule support */
>>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44
>> bits */
> Why is the 16K granule not supported? I modified the code
> to support it and did not encounter any problems in the
> test. Although 4K and 64K minimal granules are "strongly
> recommended", I think vSMMU should still support 16K.😉
> Are there other reasons why 16K is not supported here?
no there aren't any. The main reasons were 16KB support is optional and
supporting it increases the test matrix. Also it seems quite a few
machines I have access to do support 16KB granule. On the others I get

"EFI stub: ERROR: This 16 KB granular kernel is not supported by your CPU".

Nevertheless I am not opposed to support it as it seems to work without
trouble. Just need to have an extra look at implied validity checks but
there shouldn't be much.

Thanks

Eric
> 
> When in SMMU nested mode, it may get errors if pSMMU
> doesn't support 16K but vSMMU supports 16K. But we
> can get some settings of pSMMU to avoid this situation.
> I found some discussions between Eric and Linu about
> this [1], but this idea does not seem to be implemented.
> 
> [1] https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00149.html
> 
> Best regards,
> Kunkun Jiang
> 

