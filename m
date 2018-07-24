Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6756144wru;
        Tue, 24 Jul 2018 05:27:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpem+4NEHKg65igHV9f1fiQA4sdL70HrLsr/kfgSxwqtxLLbxCsq+UcQGbzDifTfyyRVt5t4
X-Received: by 2002:a37:79c5:: with SMTP id u188-v6mr14456198qkc.82.1532435226908;
        Tue, 24 Jul 2018 05:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532435226; cv=none;
        d=google.com; s=arc-20160816;
        b=mYywpCdSZjzLOx4w+HGwpfkqxtkFLbO69tmYYTJ5Ao+7PYSMjiwDM2X53bpmJ6GBfR
         sJRBNt51b4xRT19zE5wxEdoHecLLy0ps0SQ8qLvWmDgVU3jLteIKQyW2Q2aONaa8CDX+
         MdTZDMkqBmpuVxJ6gaXFW3i50eHzHE9ly1le1ieaDl5W+eV7uCm+VWl6EOmX2rRb/67z
         Q8X5RUmDQ/Fw8dG4gE9b9WP8NX437APBauuhcIpq7RGmxZgzIRj8o6UQ+xGbYt99gUqd
         371a/JZ3kVMQRw3dFg1Sy1eTun7avQ3r4t7m37DO85ISuaMRH5P6gRAzKmZxOUAyqvXx
         o0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cHUn1k2CGHMarApIf3DMyB+TWn+mW3wgHLgvp1wR9nU=;
        b=wThST+05deJXKdSwu1QMkwXcqahAIhJu9Rib96UEpKLD/ge/4mCbnkm6OOcAqWBnmu
         lm+Q0NFkG81TbJAW3Iz37wS8mzU+YWhFJl3dLaXnn7UwQhNWWmbkrlwp2nrJcyePasXh
         e6sdUAJX59kLdyc5g5t8ROUkxflU4qn61X/a5Hfjoe+25YN995Y1X2Ifb4Z7xT/N0IZF
         ZbVZXPpoUal+TSrcFStQWADFg5MVQaYU8cHMrGqySyflKBVh34GnkN+kYBEuw+ZeedqM
         Sg0fFzNeP59wasIurO8S3WcYDt8SpwBhJc6KjP85MSg+JUpTeWQrmOryJlM08P+QHNnm
         QVMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2hlNYxk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6-v6si8037284qvf.69.2018.07.24.05.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k2hlNYxk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhwPC-0001aG-Cw
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:27:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhwP2-0001a6-BV
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 08:26:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhwP1-00027y-Fu
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 08:26:56 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:38357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fhwP1-00027f-Ah
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 08:26:55 -0400
Received: by mail-oi0-x241.google.com with SMTP id v8-v6so7096227oie.5
	for <qemu-arm@nongnu.org>; Tue, 24 Jul 2018 05:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cHUn1k2CGHMarApIf3DMyB+TWn+mW3wgHLgvp1wR9nU=;
	b=k2hlNYxkOqwUGTtts4njS8gXAGU72gfFJ3UvAnwO6pyKKo2YAE+GOsIPwmAYobA1rL
	sA72TxRWUdx4YqTarV62r4NIKDGYA/MPm/IG2yN7lzO1mzs0WTWsbsqi5KdUBx6+nPoS
	8u1SzJ1pa2AZMOzfaODDlbfVT+t/ZBUnZTmoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cHUn1k2CGHMarApIf3DMyB+TWn+mW3wgHLgvp1wR9nU=;
	b=l6FpQfy24atFVvBAeqlsHqptEm2twvWdeOuASXyBcKtxhb4PhGDknFXgbXmL1z/1jg
	VOGsFx38yLehYaAxI8uzXqngfi4KcWz3NREIALUjmiR5HmgeTsZtiZLm/SoAEHn6zqBE
	68w2/qUuvX4l2RmW8y4Jjr46ErNqmCFiKWETa63O3pdcmO8IUQrnjUlMY9OsRTah3U25
	hn9fsnAjF/GZp3ljITwOme5zyCq7G6bPWtwyzVqvXjAQTj9KdnjEYMWZ4SuW6GjugZtw
	XcyS8hSXNfpUCcFe4uHjAtJS5o8UnTD7EajNh5uOEOFiVwrPEmCf2xNqLqgEMltdPFLC
	UIRQ==
X-Gm-Message-State: AOUpUlGnluA3ROCDLJpVXwxRrs03gAK6/7eydJJYiejPw8ulgrspPoCK
	jTuP3kQy8Dozw121cf743gR8+H7JPoXHip43+cBU7Q==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr3135524oic.252.1532435214664; 
	Tue, 24 Jul 2018 05:26:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 05:26:34
	-0700 (PDT)
In-Reply-To: <5c3ec438-2265-94b4-4f35-71a79d838518@twiddle.net>
References: <20180713150945.12348-1-peter.maydell@linaro.org>
	<5c3ec438-2265-94b4-4f35-71a79d838518@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jul 2018 13:26:34 +0100
Message-ID: <CAFEAcA8fFxKEbwC=rfp28cTMUT2eQVzGS8qc5tLowK3XYwEvrg@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] accel/tcg: Check whether TLB entry is RAM
 consistently with how we set it up
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UFg/4uGGlaSr

On 15 July 2018 at 01:37, Richard Henderson <rth@twiddle.net> wrote:
> On 07/13/2018 10:09 AM, Peter Maydell wrote:
>> @@ -939,29 +935,21 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>>          }
>>          assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
>>      }
>> +    assert(tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr));
>
> Don't duplicate the assert; just move it.  Otherwise,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I propose to put this patch into my target-arm.for-3.1 branch
(with the duplicated assert deleted), unless you have another
preference.

thanks
-- PMM
