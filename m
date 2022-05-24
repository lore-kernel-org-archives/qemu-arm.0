Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp364717lfh;
        Tue, 24 May 2022 10:20:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrHxmHgaALvArIl/ZL2v1pQT7wbhedVGapvv+yEQpoJoQuMwl1irnhK2PeaEi088KIHNm1
X-Received: by 2002:a25:bd11:0:b0:655:8113:bf31 with SMTP id f17-20020a25bd11000000b006558113bf31mr2085712ybk.508.1653412833382;
        Tue, 24 May 2022 10:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653412833; cv=none;
        d=google.com; s=arc-20160816;
        b=T4dJKypUreU0puy+s2YHgPkvw3gIwyEDU4gaZTT3u1eP8qfYoZwJeocPbf+BL+HUdI
         +z9pIONZU7YtaE+eSLGYiNXTjB3aim3cvAbv8hrJvDjhmvlOlIBdDakiywveHZK+hQWr
         1pKWCxIGNy6fsI7iO+nriVLEDjfFHHr82N0aHGzNo92WYLkEnYQcsBh9sYLQs7xX0qwR
         MAzcobqPBMiXoirpEK061MN+h6vvxSA5qI6ke66Qnr7MhStrVq/EEaKk5cLLHfaonzdc
         5qbizdHiXNR5KwHuXO3nxb+qXNCIocz05XNV48MDCs7uYOR9M7IsHSayo9sOJFjpEd2b
         vtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1wsh6fKAWRgaJulWZL8xCU/ms5PKQhxkXyxoe5NQ2BU=;
        b=DsHyigxvpQ8l/BTX29RvWCzj1QLZ/K+RoSSoRGDjKZQUjXV3xuCJEkQqiQvBtmDIo3
         GbkJZ22Id+1rZlCmF8b9+t0i7rnuRWIN6s/J1Gcco6jfnsyhnjeIoYLo19NTmOjq48zb
         tST0Ru70uj2DuileRr93J98NvlwzgXroHp3BcGi9gkNNa0qwfqQqHEoUMBTVHEVgLHxz
         NOoS+yI/dwfc9Gvevv28SzJZZUCudq8wZZzIqc/sJvrAOA6emKaWiYN8xl4vtk/Qsfsm
         tQdE2DzjCDPspGF77jpjRuTeRpM31sC9Kgo26KLR9Ji7F1IKFg4Vqs6yloM10usiPAjr
         KNSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=KBKEjDMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by14-20020a05690c082e00b002f80961760asi88931ywb.264.2022.05.24.10.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 10:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=KBKEjDMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntYCu-0008L7-PK
	for alex.bennee@linaro.org; Tue, 24 May 2022 13:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYCc-0008KN-Nf; Tue, 24 May 2022 13:20:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYCa-0005u7-VA; Tue, 24 May 2022 13:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1wsh6fKAWRgaJulWZL8xCU/ms5PKQhxkXyxoe5NQ2BU=; b=KBKEjDMxZyPpqtkOAowzcpGv6/
 TP/mVU9wNA6UtX5BLOW47CRUNCtqdfvHek7AXHYR25LQUFBl84IG1TuJXMPU9YaElTg03a/ijCHFV
 bT3hHplRce/VR9yjcG7i/vUrCsBRDqV28ygS0vaW4c7zSx56N6aaB9yjgCwsgLI4btIemBJQE1fxH
 xqhkr9hIJ2ydtSLHpl4hXiti9qNtJVyISOZdk7uEl55+x7V4196yweOwoPPZACzKY3QgON4iHDrWw
 Qfd1Hp6F9XKafGTO+tf42q4Di5aw3elAXzF/gTmdFOAH/Qyk5+neJUClGcKV4KyiET0FpC4I7Mp/P
 OGZlTqStIPq/K+JYSuM1pOUU1kW3y0S6OE/Llg2cRH3q2BzS0efNmDAm/DpEyIU6kBGYWh029bTLV
 Nvan2Ih4H2CxlPxay89dfxSu47apB/lLAUc/NYzj8DmGl+z2jnX18rd2WiutQLuzfwcijAQ1jDyTC
 TyTtn+avM9PMtEms9z0H5NxETEtwCZI58ONv8nfYGjMQ5ceusgbcwk+Eq3a5umPzwLEx1TY9MIrd0
 hO5hkZPiqaei0gWlORfsXKM49y1NwrPUCTbaGHT2LXMf8J9l8AlzXCAVK8aIYCPAp64TWDS5vsdWY
 aLGHPMsjCIik53vc1sLMYPWis7mqRDrhdYysv1QYk=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntYBL-000AWi-Lp; Tue, 24 May 2022 18:18:59 +0100
Message-ID: <bdf51239-7b32-66f7-9d42-46b2cbbb8a6d@ilande.co.uk>
Date: Tue, 24 May 2022 18:19:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-10-mark.cave-ayland@ilande.co.uk>
 <b3c11eaa-7549-1695-6987-c181141c576f@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <b3c11eaa-7549-1695-6987-c181141c576f@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 09/50] ps2: remove duplicate setting of scancode_set in
 ps2_kbd_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9maukYPh0HuQ

On 22/05/2022 23:22, Philippe Mathieu-Daudé via wrote:

> On 22/5/22 20:17, Mark Cave-Ayland wrote:
>> The default value for scancode_set is already set in ps2_reset() so there is no
> 
> ps2_reset -> ps2_reset_keyboard ?

Ah yes, it's just a typo in the commit message where ps2_reset() should be changed to 
ps2_kbd_reset(). I can fix this for v2.

>> need to duplicate this in ps2_kbd_init().
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/ps2.c | 1 -
>>   1 file changed, 1 deletion(-)

ATB,

Mark.
