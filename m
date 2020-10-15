Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp718414lfa;
        Thu, 15 Oct 2020 09:15:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhAkm/gs6vw50mWPSdpxq3LQP/V+/wsfKdX5+eqvt67lAVgBAF/RyrHkw5U6SZnAv2m3K8
X-Received: by 2002:a67:f85a:: with SMTP id b26mr3136902vsp.35.1602778554939;
        Thu, 15 Oct 2020 09:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602778554; cv=none;
        d=google.com; s=arc-20160816;
        b=J785fjDuht4i5RJZoZg0a9oWE99sUByZlAnxj50ZtqFVFfXgNXszpCYE9A99anXZO9
         smZexelZIZ+jA7nIJjFXhIwk01bkWI0CPvcOWO4dB9ScubQ0DtS/5VVD8/2+EYTyoNao
         zHvWmJtLpr+6Y+RwpEqN3k/F8gImSWw7HACUQj2IWctAhmJHQki7dHWpaKe3s5Tv6vNZ
         hnNVX5wyNvVfE1qsI6Dp3ryrH+0zekKMWQ6vIU04P2/MVGgeeHXlXN0XP0P/YHbX/oln
         DY55Lf8x4Xlrn7VHFHUVmR8iGFunKR4xSCmhKAN0i2o8D4l+VWfTIAaQQGKvg3iesj0Z
         JOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8ChIloslXbwzx5SwJ9bus+C0aUz+/NJpBANblR8W7fg=;
        b=xtYsniC1MxghRGkSIPdZjRvTiGXhH/LWQQ+KI/JLGQTm3UG1pBSlIR9Oaq4KYsZee+
         3f8seRPKgsaSzH492Bhz9/ZjKcJY+BX5RB8NL++ei7q4g9QKDhjNt/SwYvDvrm38hkgG
         e1cwX5yswiAJbDJTwuNS5p2nLZPq2VB9KhHjgAKwtzR8HzbBD/vD450zgO8DTjpCF8k+
         QdGSJNSZjnAMmtYXQZlTLtMBALKTcq1Crfp3Aqm7J1FwcnhhHEI0ARltWRdSKMNm6Pyq
         NCEWe4fhMKPkyMw7+MMdlXVVXu2XbRBav2hHpiAG4oPpBQq/ppPsKYBicc9mNvq3pMO7
         eDow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a/oLvkE8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si295276uan.261.2020.10.15.09.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 09:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a/oLvkE8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT5v0-0006sU-AS
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 12:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT5ul-0006qY-TW
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 12:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT5uh-00053E-Qo
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 12:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602778534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ChIloslXbwzx5SwJ9bus+C0aUz+/NJpBANblR8W7fg=;
 b=a/oLvkE8Uh/YOhO+BTZ6ro5R7wQY4Uw3r2w4dGlt7Lfllh0s4KUnMTKTkP+/u76sV7FR7T
 tUtrk42AcUq5HZkiHEqGPWXYBrG0Yog/ZE8mqal4qLE4OnPllTwPNvkxp1xx1kZl16xsK5
 f+KLhu3Xe6HK4866OkDM0eRsNMj+JoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-t4SPsqyeOeigr2XXlRbw_Q-1; Thu, 15 Oct 2020 12:15:31 -0400
X-MC-Unique: t4SPsqyeOeigr2XXlRbw_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1941412C6C1;
 Thu, 15 Oct 2020 16:15:30 +0000 (UTC)
Received: from [10.36.113.210] (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1533E100238E;
 Thu, 15 Oct 2020 16:15:18 +0000 (UTC)
Subject: Re: [RFC 0/5] NVMe passthrough: Support 64kB page host
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, fam@euphon.net, alex.williamson@redhat.com
References: <20201015115252.15582-1-eric.auger@redhat.com>
 <0a1ae4dd-064b-49c5-0669-04219646f616@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d3ba4c98-67b8-0d38-378a-805fb02b3d40@redhat.com>
Date: Thu, 15 Oct 2020 18:15:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0a1ae4dd-064b-49c5-0669-04219646f616@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijZ3RMfxTLOG

Hi Philippe,

On 10/15/20 3:49 PM, Philippe Mathieu-Daudé wrote:
> On 10/15/20 1:52 PM, Eric Auger wrote:
>> This series allows NVMe passthrough on aarch64 with 64kB page host.
>> Addresses and sizes of buffers which are VFIO DMA mapped are
>> aligned with the host page size.
>>
>> nvme_register_buf() path is taken care of in this series
>> but it does not seem to prevent the use case from working.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/nvme_64k_rfc
>>
>> This was tested on ARM only.
>>
>> Eric Auger (5):
>>    block/nvme: use some NVME_CAP_* macros
>>    block/nvme: Change size and alignment of IDENTIFY response buffer
>>    block/nvme: Change size and alignment of queue
>>    block/nvme: Change size and alignment of prp_list_pages
>>    block/nvme: Align iov's va and size on host page size
> 
> Since it is easier for me to rebase on top of your series,
> I'm including it in my work (fixing the checkpatch errors)
> and will repost block/nvme/ patches altogether.

There should be one warning (line exceeding 80 chars) but no error. I
can easily rebase/respin if you prefer.

Thanks

Eric
> 
> Regards,
> 
> Phil.
> 
> 

