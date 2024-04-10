Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp607952ejc;
        Wed, 10 Apr 2024 15:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvyAQH/GA0yUJM47A+Zd9GOF35Q3zwLCudNWbM7ibdnIsPQPXVtJVku1dubcOH7CK/KIrBCqNg6bhFrudfFVUPHLrrfs9b
X-Google-Smtp-Source: AGHT+IHq6sAU3mHSEF0AMsO2R/+MUFOaVk/iC3wtHVqHd+lrMbyBdJEJ5nQDAFro2UBY2QQo+HHV
X-Received: by 2002:a05:6214:180a:b0:69b:463b:4f68 with SMTP id o10-20020a056214180a00b0069b463b4f68mr1936909qvw.3.1712788083536;
        Wed, 10 Apr 2024 15:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712788083; cv=none;
        d=google.com; s=arc-20160816;
        b=rfFrSBZ9GwuL+5CnOAHkVde+M//L3O39DGh93Ne0gp/gy49WewrT+Ijlosd6AXXFZZ
         ordr+5CMg7eyXTRwP0IFhmsql7O6b4wTPwgLiFvA5ETFSnHE5KU8MZpaE0WEk0IvFL9R
         Di1GS2RSmCo7t9ww6STP9txsm9toA8Q8QO3GVM/uJ7HxwbCm0XryLPMaw2MzZvpH/Ot/
         osJbv61svfM3Dt9zILzBpaM4LifmcMHGcmLo1NHxPJ/3SLSUxhKcVaY27VRr4zI4yJPk
         Ktor1j2alQ1Yx2UC5Sn2u7lfMF20yZc1BAQ+WfmpOQXgY3LxLFKRYTcfTQtYYEGZphPq
         o6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=iW7GInq6njNRelC6vaTzvrf46bIXqriW5l8bxuZAlvo=;
        fh=nb/cpYThJ1J0R2SXOmfxgpxnjKY56x8noKggaKLhbBQ=;
        b=Eo6F1uI9ftMeHGGILRb3NH8e7h+1K/qB6O/iCIg8yMyPPVGk2CBZ9x3ugZ3+wD0rEj
         +HyElrEXUWAIPNDArmoBbrPbmUfbBPmcbORtqu+c+kiclv6O5hb539/G0tINlOfl0CTr
         kOc0oHgm/v6+r6PgfSgqWdY6nP92JkwaY8xDW7XA1Gzs+eOsSXi9SthxfAVEtZkuFebJ
         1le+X0My1d4eJYwQDlMfq/yQtgJhC7vEUc9QlFXSvFKKVEp41AEGZ8yKZXA4HDx1OMsA
         JdIjxsj9kDgKzeXc4qrTnmHw7XuA5LXI0b80W7ZrivdVPcQbgLAiYaOHxdobBMlogEZU
         +HJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eu12-20020ad44f4c000000b0069905f21e60si167283qvb.493.2024.04.10.15.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 15:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rugPs-0000Dg-C3; Wed, 10 Apr 2024 18:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1rugPr-0000D4-JP; Wed, 10 Apr 2024 18:27:39 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1rugPq-0005UY-5f; Wed, 10 Apr 2024 18:27:39 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8BB4D4E6005;
 Thu, 11 Apr 2024 00:27:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 5xJ6R8LCw7x6; Thu, 11 Apr 2024 00:27:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9C0F94E601C; Thu, 11 Apr 2024 00:27:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9A4417456FE;
 Thu, 11 Apr 2024 00:27:33 +0200 (CEST)
Date: Thu, 11 Apr 2024 00:27:33 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org
Subject: Re: [PATCH 00/12] misc: Remove sprintf() due to macOS deprecation
In-Reply-To: <c4c8f2b8-7ef2-4b2f-a9d4-8c1e64668570@linaro.org>
Message-ID: <220fddca-0017-79c9-ec1f-23bb8a68728c@eik.bme.hu>
References: <20240410160614.90627-1-philmd@linaro.org>
 <c4c8f2b8-7ef2-4b2f-a9d4-8c1e64668570@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-614907941-1712788053=:22034"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HtBdQY5uhCKX

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-614907941-1712788053=:22034
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Apr 2024, Richard Henderson wrote:
> On 4/10/24 06:06, Philippe Mathieu-Daudé wrote:
>> Hi,
>> 
>> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
>> resulting in painful developper experience.
>
> Is snprintf also deprecated?
> It might be easier to convert some of these fixed buffer cases that way, if 
> allowed.

I had the same thought as some of these might also have performance 
implications (although most of them are in rarely called places).

Regards,
BALATON Zoltan
--3866299591-614907941-1712788053=:22034--
