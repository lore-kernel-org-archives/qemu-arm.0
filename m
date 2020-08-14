Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp618641lfy;
        Fri, 14 Aug 2020 10:07:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcRVucFZQh6eOhJiSqpKqEyhbDxhQKSYP5FVgJN7iLH5tamVDCJkvjaeXoo+vTSLCfiquE
X-Received: by 2002:a5b:a87:: with SMTP id h7mr4609867ybq.333.1597424822746;
        Fri, 14 Aug 2020 10:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597424822; cv=none;
        d=google.com; s=arc-20160816;
        b=ATQho0JsJ6H0vXWQm0kO3vGZdG04ghBSgzcDrfttAlmNwgt8c9gy5SxkOo1pGi5SA4
         bnpMNmDFG33aFAR3AgCocXwWuP37+CYGf6+Gbx9O1RnoyQa5AMxNp3hvbh17n4qMl3ER
         cU/VHOHWOqayBbwYraQCpgf6bJfgDp0UlNZi3zrPNwoTGZCJLtQh0M97/fbTPTSEPC5C
         Wo5srNmYI+P4tc6mixj+JlDrXnYoNG5kifTOpuIBtmGI5XUhMSky6u2NhDuY7ABd3Uie
         JgRG2mk2gE1JCRnqOEFVUiaHa5KeW6RoxMVdVprM4fjOVpBatrzp4SuwGNnDAAI5VZZ/
         QBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=31MFWIsb2XQOD+71CJ1vmVrKBD83n2vRePCXhSO6DOQ=;
        b=YGaubeR93NMo7/0gMTCMYbj+piiNIibLpK37a6Lg7oMetfEAwWjg3qOcLIDd1GZv99
         qi1CwV8ou3QLWRjEAWk/SZu7Kk6ees1JI+sG4n6Kb67K8qmUgBUShC8wYW/xtfmLby2d
         lHq77AJl3clgzu4HOgl3VzkiW5GZYYpfI2GmKPYhTqjXX4SbFrbOwSqsGXodaO+9DZuO
         xI8ICUJDm6VDyDxv8VmuMMVXkgEGh6WoGaeJ5CesjURmxBdVeS0qMOYGVnsPayq5mahT
         Yj+auVw0EWTEkyerBFKB0GHZ9qdMwBuNgbOAwSjufV2ugZfIT71Mrl950bdz1ksGtsCH
         YQng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i8n46mMU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si8750751ybb.447.2020.08.14.10.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 10:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i8n46mMU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6dAU-00005v-5p
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 13:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d9U-0007Pt-Rb
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 13:06:00 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6d9S-0005g4-5Y
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 13:06:00 -0400
Received: by mail-pg1-x541.google.com with SMTP id d19so4811915pgl.10
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 10:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=31MFWIsb2XQOD+71CJ1vmVrKBD83n2vRePCXhSO6DOQ=;
 b=i8n46mMUXUWcflzo5c1evRKhZZ93a93I/axbtrkXMGOvr/gC3QPrQXQuDs0EcMrETP
 FiaeBV5BytZ/8nSj0J8SF4Hm/jx4G5mg6oeunb875NMnQuIo/Qya0ZnsnimkjWguX/X6
 DOYXhQ7TgpWMNzPySejvD8/S3x4W4LPziPn6hkeKEsuHS34eiy2YnOymx3gFg4+/VGpK
 tOnRksL/JPcjJVUo6Nvxyte2VMREy7r28nAe6Y5guF9+GAjpFknIlucTAFpAWLVx/onC
 xm2vR2bdk+u59G7uU0yvjwA2/uJS1B7Cgv5R3wqArWWBycTImS4CnARgbBJKXCD5XpTv
 XQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=31MFWIsb2XQOD+71CJ1vmVrKBD83n2vRePCXhSO6DOQ=;
 b=c4ZkExTYmocmjUfqNQHtHesAB4kQIVBr80W68UJeTnT2LPcdtAqMYNtzwKo+itWhkA
 0Aiv5yyI2w63HXz0HBkdOClQdpq++PHMJhVk8vdCRozz4sp7036w22eIxVIkQcA8J9ia
 ayNoKZc7MPEezsLA1eeUw0JBrNf1rwbv0J40H2Zqn1o4cbVr+gXlhqRF6M8eOxTR4Geo
 uhOhdUo4ErG1rbqnI6vdaVkHf3YxxJONnXpglm973+syCtyf4I3UhHVF5EDMdwODoXe7
 enPYOZb+5QInG/S5vpXfSTS13CInfvOkXTaXVRrXQvt3gR7RfjEno33WHyQkjZD7hIXj
 iMew==
X-Gm-Message-State: AOAM530181uCXpJH+fxRk+a3R+2w6N1q3YN4jW1Ecgx5Hby68LA+4EkY
 LpZvBlCSYPTXZeczzvKapzMDog==
X-Received: by 2002:aa7:96ef:: with SMTP id i15mr1701694pfq.231.1597424756523; 
 Fri, 14 Aug 2020 10:05:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b15sm8710674pgk.14.2020.08.14.10.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:05:55 -0700 (PDT)
Subject: Re: [PATCH 0/7] hw/sd: Use sdbus_read_data/sdbus_write_data for
 multiple bytes access
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200814092346.21825-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f98534f5-52ae-efd2-f71e-1c592bd98ffe@linaro.org>
Date: Fri, 14 Aug 2020 10:05:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814092346.21825-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DjuJv3mXlO7X

On 8/14/20 2:23 AM, Philippe Mathieu-Daudé wrote:
> Introduce sdbus_read_data() and sdbus_write_data() methods to
> access multiple bytes on the data line of a SD bus.
> 
> I haven't named then sdbus_access_block() because I expect a
> block to be a power of 2, while there is no such restriction
> on the SD bus (think of SPI).
> 
> We can also simplify the bcm2835_sdhost and pl181 models, but
> it is simpler to first let them use the Fifo32 API.
> 
> Based-on: <20200705204630.4133-1-f4bug@amsat.org>
> "hw/sd: convert legacy SDHCI devices to the SDBus API"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720136.html
> 
> Philippe Mathieu-Daudé (7):
>   hw/sd: Rename read/write_data() as read/write_byte()
>   hw/sd: Rename sdbus_write_data() as sdbus_write_byte()
>   hw/sd: Rename sdbus_read_data() as sdbus_read_byte()
>   hw/sd: Add sdbus_write_data() to write multiples bytes on the data
>     line
>   hw/sd: Use sdbus_write_data() instead of sdbus_write_byte when
>     possible
>   hw/sd: Add sdbus_read_data() to read multiples bytes on the data line
>   hw/sd: Use sdbus_read_data() instead of sdbus_read_byte() when
>     possible

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

