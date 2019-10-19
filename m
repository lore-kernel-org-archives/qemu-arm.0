Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2437837wrm;
        Sat, 19 Oct 2019 10:35:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzulfmRo3PVWGi4b6b2wHCF3aeQdM2Gec2/jAQeVVWZvCJKsd8xBlWNlZ0A9p9UfijKEbeE
X-Received: by 2002:aa7:da4a:: with SMTP id w10mr15772684eds.209.1571506538666;
        Sat, 19 Oct 2019 10:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571506538; cv=none;
        d=google.com; s=arc-20160816;
        b=CTTbSJIvuKOk2TOEfXxUGa8ccNYSaw7IBTb9s9D3RZwgbnjos6RkozOD31dSybXknf
         c/A2kxF2BhWnDhAPxZwHAoygH3lb/oYZKBZUctc/dJyCsSg6xvk6xpwSXGp4efz+so6P
         U8/uqOHqth3IV1AyPack8NHANDFtmNnrb0B9XyJdowuAjW0uSfvDKt4Kvht37UyS8PUr
         tFmL9JF3WNE2xfljTg5nDJIJhrMmmbjcGRMolQJt3MQyZvmvgqKYLVWiv1i0IxJXIDkJ
         Qzpd/zUt+vR+zoZ3INscOZO+UUMwVzJnB8uYiWql74yVi6uLW6ZkHiCGSk70o0JprZlM
         CqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=P4IA42ejsixRMBgMIMOh6M/+n81HIaQ/gu3TCojfckY=;
        b=V/awKLScOzKSYgIjQXa1AQjACsL2gTe6gpqGocv7DgP1/jdrUahfLx1Sv5xkCfZqAs
         yxaOhQ8Z/3D2w7YGnzZACV6x2OCvhValRWqLYEGsQWVb3PgWwnXwVW9VCZiXZeS8dX2E
         D3IydBYjPkkoz7VQKjWLJcD0s5dLOwpk/8CjYxgzgwh5tVA8z0Sh849lD0u48+rCBvMe
         sCXlmYT002NwyITDSxGFfiWOniNrn1heMMpn3Q8GwVypXD0lwm4l1MlrCVBlmTXO9oKz
         TYpu2JVmwdb59LxgYL+ryQiCV/yeOWb0oICpep6jPJv7nRuhaiEVn3vTZTPKMewu/U1F
         LrTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ata0KIvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si6046001edd.269.2019.10.19.10.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 10:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ata0KIvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLsdd-0005AO-Jt
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 13:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLsdU-00059a-9J
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 13:35:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLsdT-0001zz-2v
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 13:35:27 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40925)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLsdS-0001yt-Rg
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 13:35:27 -0400
Received: by mail-pg1-x542.google.com with SMTP id e13so5132613pga.7
 for <qemu-arm@nongnu.org>; Sat, 19 Oct 2019 10:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P4IA42ejsixRMBgMIMOh6M/+n81HIaQ/gu3TCojfckY=;
 b=Ata0KIvOf4KMGAqAu2qXuKFQhjqIue5/X0bFyWDeMH2/VOICdOyqQup/UOrPIjBrcs
 l20lhhiYGVWaI3rrBFL2/W00yunjZf70jWcuPvJpvxnrDTZOPAut2demP1UKdV4LuI4i
 J/RY6POMACdCS8dD/ZKenO2fdhR+P+kbp2c8UEeRpRNy9p00TjBhedCT7LsOFMsElHVS
 qC2HmhybMlRg726ADnnHbmk+XvztyRMwlT3lHk3R0EbJKHWVxi30xfVxotgt1oltS35L
 G9LHsPSgB2PlHDZZWofRhmGAc2sAWBUm6etIo7RLX7RGWjagDn68QW3JHqtQzkO+gAo0
 gb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P4IA42ejsixRMBgMIMOh6M/+n81HIaQ/gu3TCojfckY=;
 b=b2IxmoH0pivqJhuY1mvxrcuTkhhQ+qDpNf9bQwfqFwz2YKbdF2qUEmHO+JPTzqYd+G
 P0GwrvOD2jQVLx599UWVDjsGSAagHbFgy2AbngOppRbuuiQJq6YSSZCqgnX0nkIV4Akq
 /rxUIhrq51JjX32StgUgLOJ4DpvgsccFD+/nrOJgqLOh3eo0R7kLgT3UnPAhWWodYBq6
 jZNGsiCz/wEbWugKMaek5Z4BXjXWXWIt2V4OedJMzs74sUQnG15aNmRCBSEhNz5YKs2I
 HdWiQvQFFStqwPoLTzT1sNNhDen6l0d5jP96X7rojXHiYEcDKDMyceVM5xzHrBDeb0Cq
 HWJA==
X-Gm-Message-State: APjAAAUE1Ef/dF2ngfLZXB7zWFyV7S+l8wbRzrZyY0r3SZKMh2r/2Yi8
 81f8DAhpg9RpCm9vV0OKcZsung==
X-Received: by 2002:a62:1454:: with SMTP id 81mr13610721pfu.188.1571506525230; 
 Sat, 19 Oct 2019 10:35:25 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 127sm10044929pfy.56.2019.10.19.10.35.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 10:35:23 -0700 (PDT)
Subject: Re: [PATCH v5 01/13] add device_legacy_reset function to prepare for
 reset api change
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-2-damien.hedde@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a6c43bd5-9119-f8d3-5046-eeece7d842d7@linaro.org>
Date: Sat, 19 Oct 2019 10:35:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018150630.31099-2-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, david@gibson.dropbear.id.au,
 philmd@redhat.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 edgari@xilinx.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xmG96I+VpFbe

On 10/18/19 8:06 AM, Damien Hedde wrote:
> Provide a temporary device_legacy_reset function doing what
> device_reset does to prepare for the transition with Resettable
> API.
> 
> All occurrence of device_reset in the code tree are also replaced
> by device_legacy_reset.
> 
> The new resettable API has different prototype and semantics
> (resetting child buses as well as the specified device). Subsequent
> commits will make the changeover for each call site individually; once
> that is complete device_legacy_reset() will be removed.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
