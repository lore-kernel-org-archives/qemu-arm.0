Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp175082lff;
        Mon, 9 Aug 2021 02:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysIl0b556lST4gcxnEByyOE9vT3nn80P31F4Ei1h0pO0e1GAZw6RaSB3GYwcMnvolJHVVe
X-Received: by 2002:a0c:8dc6:: with SMTP id u6mr11485757qvb.57.1628501526605;
        Mon, 09 Aug 2021 02:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628501526; cv=none;
        d=google.com; s=arc-20160816;
        b=g/v+HLHtkVFPCrukWq/zZl/3Y6TytxpFcm/C1+vO5zHbNPfaXUNA/k0aU7PSEkSL17
         MHiwsl0hS6irzN5u+n8K/VUEz9CAN1wZUbg8EriICITclcoBth8K+F7rQevPENcAQE3I
         1IyRQrflbpeUxu+9Jc6h68gDCYXSMimwg+MYs30NUV8JG2qnDYSVvWsb5rSqW6IMok1t
         rWM6KBj7YcxWkF8HNEpK6ZvlCgoXSeV+7xxKXD8GjGUQXshCx8cUrhuL27+VnUliFENP
         As4pp3GWShfYT0i3BFqtrdlSx7YN/s6arRXRDvY/EpL98jD0F2pgoMbtX9sbss9OveGN
         7QyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=K6BF3LXD3SuIw1YI02Dj1lw/a9hpC+xf2JrGcnvQFX0=;
        b=NRRzGq+du5AS6aH/gsI3Jj2pfU9ezHpLFsoY089HipEk5yU1eERr1t7css/rA/ayLi
         hElgTuIRPlFxyeyziHbs4K0rLIbZNuHTvx7Cp2kqDBNXt8WNBPrANyFo1vjIIeWly0gv
         my+PMSO/eG53lLURjI4PeixH/cxgqTqlhbbooFgbyJt3p0mA2zSz/mliHyouHccgVDPm
         VgT9vB/EK8q4Gnw98L6XFdBpG0Xf0Kb5S4m4i03g7N+O7bwn2JogxnzmNV7+VkxlL1pg
         MMOrA5MAmCkdYyOVsfZ3tVDtebEQl7CmbeGunp60iEpD6+AeSs0a1L1iAAIKURhbv3+9
         6NQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PoumDVye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10si10958129qkg.118.2021.08.09.02.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 02:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PoumDVye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mD1dd-0006Lg-Tu
	for alex.bennee@linaro.org; Mon, 09 Aug 2021 05:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1dT-0006Kg-QV
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1dR-0006id-13
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628501512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6BF3LXD3SuIw1YI02Dj1lw/a9hpC+xf2JrGcnvQFX0=;
 b=PoumDVyeI2v2v3RmnoyzkzHGq4ioq09HYQ2tXdvXZiBJfU6vfut15gBofj8twusItjPhJ1
 rpi3JscjSSFyWJh9Mp4E/66Q5pvwGPA5VHt3aCxV4gNmRy+wTuRK89wR5Z6DYtkGbnyJD8
 GRVJambKhhTceZKD/pF839WzyWTh1C0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-cdbsRBE7NHaCcXrPs_FFjA-1; Mon, 09 Aug 2021 05:31:49 -0400
X-MC-Unique: cdbsRBE7NHaCcXrPs_FFjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l19-20020a05600c4f13b029025b036c91c6so3849507wmq.2
 for <qemu-arm@nongnu.org>; Mon, 09 Aug 2021 02:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K6BF3LXD3SuIw1YI02Dj1lw/a9hpC+xf2JrGcnvQFX0=;
 b=k3jYoUnVPkzP6n9tK1nt0jaPjqeez4h2JUBEZPoY15DgezkLqFvKsW/i1R3Hzt96TJ
 xV7SJQZ/ueTr7RIDB+fIeaYJqKauZeI/MpxUZxZRLjXw7idRXXaEgWbsgFjBaQP5znM1
 8WYn/H0tiN+tAGnLGJQZ4R10SSx/71T564dvpx38Sx9B27IuE2fDg3iTE6j6jt5FngLE
 p0otQCIfmOxzYDNxW9o3tTfiRLHq/kQEW8iTdqY38mMCD2+iFWB+otr7TuuczRFCVtG2
 XRa7JTbvMdN7hKWf6bxBKfb2oGHkiTpX19jAqdVL+NICLxDV9634c+/dlb9BHHW1tAOs
 Tgfg==
X-Gm-Message-State: AOAM532ufunVOaNzTutP2kSLvx8t7toOCGEZ5Tsa4TiuaymtIh0VgO23
 BHWXea+gIgSQ7SXkmFauAB1n6g8fQ6vUqU6KmGXo5BLU251nBPuzGLMgP2lKQ0h8m0JukMHsCoB
 brNxC3DExhkDK
X-Received: by 2002:a1c:e919:: with SMTP id q25mr11109875wmc.28.1628501508262; 
 Mon, 09 Aug 2021 02:31:48 -0700 (PDT)
X-Received: by 2002:a1c:e919:: with SMTP id q25mr11109852wmc.28.1628501508000; 
 Mon, 09 Aug 2021 02:31:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t16sm19097436wmi.13.2021.08.09.02.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 02:31:47 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Alexander Bulekov <alxndr@bu.edu>, Qiang Liu <cyruscyliu@gmail.com>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <31b39c41-17e9-3901-66c3-622afc653121@redhat.com>
Date: Mon, 9 Aug 2021 11:31:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95z48ilbBjc4

On 8/6/21 4:42 PM, Alexander Bulekov wrote:
> On 210804 1451, Qiang Liu wrote:
>> xlnx_dp_read allows an out-of-bounds read at its default branch because
>> of an improper index.
>>
>> According to
>> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
>> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
>>
>> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
>> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
>> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
>>
>> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
>> will write s->core_registers[0x3A4
>>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
>> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
>> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
>> rather than 0x3A4.
>>
>> This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
>> but does not adjust the size of s->core_registers to avoid breaking
>> migration.
>>
>> Fixes: 58ac482a66de ("introduce xlnx-dp")
>> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> 
> Acked-by: Alexander Bulekov <alxndr@bu.edu>
> 
> If there is somehow a regression, the test won't fail in a fatal way, so
> maybe it makes sense to throw in a setenv(UBSAN_OPTIONS=halt_on_error=1)

Where? Main meson? qtests meson? setenv() in the test (but would
override preset variable)?

