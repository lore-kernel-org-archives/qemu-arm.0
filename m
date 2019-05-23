Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1714443wrg;
        Thu, 23 May 2019 06:17:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgzcC82Y3OwaYLsAaH5g8bmg33Q48nxKkOglkKDmnKRZN5fN5aEeDGrIcZD4t0maSKCIj6
X-Received: by 2002:a50:d791:: with SMTP id w17mr96766446edi.223.1558617429903;
        Thu, 23 May 2019 06:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558617429; cv=none;
        d=google.com; s=arc-20160816;
        b=X8lqtNEpGe130cx3vrOnIL7lKoLUOGODxh+6595b7lZgX35gU+tzSVAH1rC8UqL8jY
         LLM12mK0M4R0yY0Z6Vyw1svOR3mJpWlglOs/ej1YjI/31y1CaosJsWaTv03lsTTOS4/D
         b5x3gDazDhAcglg4JejY2DkwfUmgaKhPUP77r0nerf/fwixjZCDL4mwxi2YXO3lxdhmw
         lLK2S7j+vKoez6fQ3kGPiYpQQ5Pgvpqqgxrj/SNyyGrhMEwqK6Y7vCYRnEcXybXvXDwy
         dYJyL1z0Gz6/HZ2Qp2tITsts5kTu28AzYcEhgn8kYfDy6IpOCUkeQsSSYaNQYdmvfaDC
         e43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FRXAPmgejnkokyUn5/u6JjUKO4+pIqALDaTI9FL0/Qs=;
        b=Wcy1eEGlu1USdKBPB0KUanKXYYNxWAqK6S6DmLsw2Fm6eOz9lhhlKjW134DW9mfOnq
         Gf3A8OlbUj1iFbtHDthPXBcChROm9Ak+cfe5b/MceJfgXignZj5zhw6yC+bVmuxf3CTO
         YElWr1rTqoRDdXFXRD6gwXtaS+cYQksTyB55HZr3POupXxTalcITWIZY5DuPj/uL9rh9
         JiGEUKl/eBa5WknS1O3KTsVtcvVdrJ/9B/QwaJ+uwVRgKogwr52FyLevYG6LSMt1QmbP
         CF1vQkSE4SyhBtvaDNBh/Dct7n0055TcCfVzg+BmHpVF7Ew+9wbqFXwEF6YlbDR1R8qC
         NO8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i2EuFDH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a55si12658670edd.174.2019.05.23.06.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i2EuFDH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnam-0005TB-Of
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:17:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTnMg-0000WN-Nw
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTnMf-0006o9-Mc
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:02:34 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:36569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTnMf-0006ng-Iq
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:02:33 -0400
Received: by mail-yw1-xc41.google.com with SMTP id e68so2231993ywf.3
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FRXAPmgejnkokyUn5/u6JjUKO4+pIqALDaTI9FL0/Qs=;
	b=i2EuFDH/Djtiz7jpC8oGaolNRNCmw8tTcG17wTdtIrdbQ3W4lCFwetCwML766LRZKI
	4q9QeBuEdLbUgwy6lCrRT+vCWEsBocxajXMafSbYbcHOPNlMG481H+NRhwfkhQ/1eAMR
	Q3zvO2pTaGiFA65a9rVAOFQpYGQf/Mu6Od+cJvNnz3gvux6YXWss4hC2/y08v0dTq5vN
	pDG6fIshnb8VDIjERiIqW/NB+Rea5pCdUvN9yrAShBmZvzCcGsIm/nRbvav/BLyZkvwb
	KhdBhXE9Qstb7G5A0uxSyox0Ash8MWn3GquPAaea/gV5kNdL8f3fL8WeiF9Yfq/Xk/v+
	CeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FRXAPmgejnkokyUn5/u6JjUKO4+pIqALDaTI9FL0/Qs=;
	b=rWNp4HrEjAcSZZ2lCB1tUfbhzcKN2crkmKYk/2YmxzWTfhoF4m1K4hmJ6ah6R1Bpfl
	2X1hHTRMvZoqheHf8CWnvzH5iSzE+ouTfRRw9lwpzkH4Ee5h+vJml1pw4WSScrRoGDd4
	W33Pn/OrbC/LZROxBp3rYxVNSneSSA+FgP6vdUePUeQCqhIenvS4gby89YyX5a4D/dfv
	vpMIlwyR8Wb697v7vufFHnVCcFF81NyJimGwJ715yqt7zGSEIeqkAbI+b5prRHlXyfAY
	yvI5HZSPJRT+D1rem3jDGToHcoIETL0NVDEzHin2HT3stpncoORx019hHZx3MuDE1hcN
	s6+Q==
X-Gm-Message-State: APjAAAVbTGcJaCCERNxxeibhNZ/GDpTVstHu4XI71eBO4toNqi+nSDjI
	9i1qrJu4dJcwy8LG5oaQxZc851lNZww=
X-Received: by 2002:a81:5e84:: with SMTP id s126mr23702300ywb.32.1558616552359;
	Thu, 23 May 2019 06:02:32 -0700 (PDT)
Received: from [10.240.8.143] ([71.46.56.63]) by smtp.gmail.com with ESMTPSA id
	e6sm7294374ywe.104.2019.05.23.06.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 06:02:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-3-richard.henderson@linaro.org>
	<CAFEAcA88nA_2u1Yc-9ZPAy2w6LVk5f9Rrss0e53E11W4Xb4YpA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e177b43a-2abc-3aee-461c-2cfd9a8a0a20@linaro.org>
Date: Thu, 23 May 2019 09:02:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA88nA_2u1Yc-9ZPAy2w6LVk5f9Rrss0e53E11W4Xb4YpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c41
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Use tcg_gen_gvec_bitsel
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /4xreudEHCwe

On 5/23/19 8:46 AM, Peter Maydell wrote:
> On Sat, 18 May 2019 at 20:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This replaces 3 target-specific implementations for BIT, BIF, and BSL.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> @@ -10916,13 +10925,13 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
>>          return;
>>
>>      case 5: /* BSL bitwise select */
>> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bsl_op);
>> +        gen_gvec_fn4(s, is_q, rd, rd, rn, rm, tcg_gen_gvec_bitsel, 0);
>>          return;
>>      case 6: /* BIT, bitwise insert if true */
>> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bit_op);
>> +        gen_gvec_fn4(s, is_q, rd, rm, rn, rd, tcg_gen_gvec_bitsel, 0);
>>          return;
>>      case 7: /* BIF, bitwise insert if false */
>> -        gen_gvec_op3(s, is_q, rd, rn, rm, &bif_op);
>> +        gen_gvec_fn4(s, is_q, rd, rm, rd, rn, tcg_gen_gvec_bitsel, 0);
>>          return;
> 
> We were previously doing different operations for these three
> different instructions. Now we seem to always be doing the same
> thing but with randomly reshuffled register arguments. How
> does this work ?

Because the three different instructions perform the same operation with
reshuffled register arguments.

I'm not sure why we were using different operations in the beginning.  Possibly
because those formulations do not require a temporary?  Possibly that's how
they're written in the ARM ARM pseudocode?


r~
