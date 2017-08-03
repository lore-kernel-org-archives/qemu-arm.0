Received: by 10.25.221.202 with SMTP id w71csp1187202lfi;
        Thu, 3 Aug 2017 14:34:12 -0700 (PDT)
X-Received: by 10.55.26.94 with SMTP id a91mr333923qka.174.1501796052236;
        Thu, 03 Aug 2017 14:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501796052; cv=none;
        d=google.com; s=arc-20160816;
        b=ee5kY+9NEn7xdmZU2rDLfUbQ19C19J3uFQK4GhR6Qcp/zZIJ8JyURLR12ZdO26Q3jp
         NBal3ICnPkNk6qDtYAKaCLMlbXvStElrN2Gd6OWZ4ERN2cuBLum0F0gq410sFdD5Xs7/
         I9bTj5j1jYwJ1F68Um79GUy4xrgCJ88R3X3wDN012w2MIxkqKtOnIA7oPPV/d4M+WDBN
         YvwOZBHxSMmJfo9gefuSIo1lcR7T6E9lDEcn6HpNCqBfj5EYpcSV1s8I6y3NVxBWImLU
         ffkYid74G/G9l2fyFwHttR//zbqQxxwgczQsRMiwWZdI2nUy5xjAP4vXzV8BTa6Mw98y
         jAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=G0eg2D+AANxVTZS0cSGSJLLhr3hPStJCRELoBdLCDgM=;
        b=bfl57DgaTu6u9oICFCQfpoicXKBm8yWA+0zTEtXKVWIpD58iEYNJiCp1U1uebaBjDc
         yUWEoBklKYFx2RfYn9rlFGG6F/X+LrOTOQxmMYptIQXUMc6IzynAOlS/kcEIZHnwq9Gs
         f7TI4am8ExN/bhH18IiD2pi8kxoEkLip0CeU08b9jMKZFCGQzKkZulgz0ODEoo18dJar
         DAoicv1n10N/Ud6QnUTOJiwfuoJyIxFfhT+FsE0AErJx0dcS2Ho6/zMwUX8Jaqf8seFY
         5C8rl7oPuW7lwUx01tHRnNOEvbkte9qeclkYq1WOmqZGyl1JNCcfIwT+CsPD44YWO+MG
         bL8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Zyyr21FZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x61si32364272qte.437.2017.08.03.14.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 14:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Zyyr21FZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddNkv-0005ko-Hx
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 17:34:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNkl-0005io-Bk
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 17:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddNkk-00064A-Fj
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 17:33:59 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddNkg-000600-9B; Thu, 03 Aug 2017 17:33:54 -0400
Received: by mail-pf0-x243.google.com with SMTP id c65so2589609pfl.0;
	Thu, 03 Aug 2017 14:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G0eg2D+AANxVTZS0cSGSJLLhr3hPStJCRELoBdLCDgM=;
	b=Zyyr21FZAX37JqYWThYBYN7l0BFBHnKdU5ZJ7wxK3UDRIcQSYYZS4pVsjhIRZniNYV
	FP1rT3ZLvQmvHxWuZXYpH5AP6EUnTrIl9umc3B0k6G6K4Kij4OX25+difwYa1MWPvdom
	2h0ePQzbcuBqJbhXns8Tvj1OeHFSWQD081vOAtiwF5jNBrKmOLQo+z/KXRp99i/neWSb
	HZlA/UWuiS3nsvOQ3Ecby7EI4Bn5ICQdgLpaX+jmzv0dSffe98Tcgy/byrWioC9z6u9v
	1I5ANg/isFb8+tBbmFsOztuRjC4gAovneqL8iIp/Ybyt9PogJ5q2grymr5gt8KTD9hvX
	vpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G0eg2D+AANxVTZS0cSGSJLLhr3hPStJCRELoBdLCDgM=;
	b=HL07UleqNP1d/6BzevQb/nYbGUS82+M6q26cLFV35E1zVSH2XIlJRFQ59K50Qaxkfy
	w/RGrTruEislHJ6rs5Yk8pzDGLIQDg45Hweo6AGDtuBiZiWQrZHtFFN1z84EJw+1IjjV
	ruz4ny/c7FZGHPtTUvbl3+gtLdzF2nqDRt11AW04DyR/X4DujKMMGK5fgBE7GIkPZ7iR
	d4i87g/HqUBwVk/5Zh2JMvpuYif/NpW4UNLGsvQgMNylWTepCVsa02ID4G8p4w1YFBrQ
	48nXzTd2fBwdQ3BKrLlWw3Di1uYWZb7s6bRFG4hVUgZFnwGlVOTCYJZTIWZczUEMnICJ
	Oxtw==
X-Gm-Message-State: AIVw111iak0w9366GdbMZy9QaFTnKyQq5GD+OFjnTJUvYKZgoO+O/Ojj
	KgLqlce0kUuN5Q==
X-Received: by 10.98.158.194 with SMTP id f63mr188364pfk.288.1501796033262;
	Thu, 03 Aug 2017 14:33:53 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	q76sm17528272pfg.42.2017.08.03.14.33.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 14:33:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1dc53909-4cd9-2977-1188-d0316165652e@twiddle.net>
Date: Thu, 3 Aug 2017 14:33:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/15] target/arm: Tighten up
 Thumb decode where new v8M insns will be
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHYV+p9CKQS7

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> Tighten up the T32 decoder in the places where new v8M instructions
> will be:
>  * TT/TTT/TTA/TTAT are in what was nominally LDREX/STREX r15, ...
>    which is UNPREDICTABLE:
>    make the UNPREDICTABLE behaviour be to UNDEF
>  * BXNS/BLXNS are distinguished from BX/BLX via the low 3 bits,
>    which in previous architectural versions are SBZ:
>    enforce the SBZ via UNDEF rather than ignoring it, and move
>    the "ARCH(5)" UNDEF case up so we don't leak a TCG temporary
>  * SG is in the encoding which would be LDRD/STRD with rn = r15;
>    this is UNPREDICTABLE and we currently UNDEF:
>    move this check further up the code so that we don't leak
>    TCG temporaries in the UNDEF case and have a better place
>    to put the SG decode.
> 
> This means that if a v8M binary is accidentally run on v7M
> or if a test case hits something that we haven't implemented
> yet the behaviour will be obvious (UNDEF) rather than obscure
> (plough on treating it as a different instruction).
> 
> In the process, add some comments about the instruction patterns
> at these points in the decode. Our Thumb and ARM decoders are
> very difficult to understand currently, but gradually adding
> comments like this should help to clarify what exactly has
> been decoded when.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 48 +++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

