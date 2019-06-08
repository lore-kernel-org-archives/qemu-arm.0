Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1554709wrg;
        Sat, 8 Jun 2019 12:49:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQNY3vnsA5QsFK58uoU3DsQ0Aerph7aIMWjWS+kJxkMHx5JPz6cKnZVUg32xe1GsnhfqhE
X-Received: by 2002:a05:620a:102d:: with SMTP id a13mr29600375qkk.268.1560023354160;
        Sat, 08 Jun 2019 12:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560023354; cv=none;
        d=google.com; s=arc-20160816;
        b=JeaC/7iZpXkxvctabaJvDEximlQIEv9FeDx7auIOJEgn9VLmMRFPKSBEwlUE6Q5xtO
         OOGMn20t6ML5MWIecBEY1YFAWcEeZpz6ZXa5P1b1CqK0yDYBF4BXu/7SRXvPJUrBFNPg
         O9rEPIe9MEUuhvzEhaooH4otfGPWDgKTY8Uiqj+PEi04CFHwnIU7HyAX3Ro2FwfhBqSu
         YP3SLq+M9x+i6A280+7X5Oc7Z/xsK6hS0A6CHb+63ZOrk+IldwOimOxeMJ98SqqYyLGj
         gg0/8+EbQGXcVoDhLO6asXf5VsbDQ1f8da0g7uhJw38s0lJ+uTTttnDl6QZ4ROxs2RwT
         bVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=jxC0whbcZyna0ZKfC75qO3iWm5GcNCiXEvH7s34glZk=;
        b=IOdENfB/UFOmk3fmF7ZBZF+f+RCJAzXLeQcoMhsYEVn0J0+Vrsz4cvA80nDzMeyeU+
         0y+lXcQac7VHdDkw3kq3HO1vxojo0MDmwNn2qqZIfjhdXDGUzfjt7fDUBWAPYddXffYB
         +bP+Li197haCRk3J/OKjyQ6qQM79PIaydNdK5wxiJ3FvJ0WF6VCUSPS/gfPGZex9zr5p
         SB8CZo9iTMaeTzUnrsKeaos6EHza/FILN1obPimsTbHOotXY5WYmeyNIbkApmugWbilP
         kFjpKuTFbsJ/AeU85Mp0JxcbdvobkJibsA+GTzsIu0P7FdtqTU7P63fucCiG2a+v6aBR
         SeSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sDArnVMZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s29si1302489qth.286.2019.06.08.12.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sDArnVMZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhKz-0006tz-OI
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38769)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3Z-00011z-6r
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3W-0000gn-3n
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:13 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41385)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh3V-0000Tc-HM
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:09 -0400
Received: by mail-oi1-x241.google.com with SMTP id g7so510773oia.8
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jxC0whbcZyna0ZKfC75qO3iWm5GcNCiXEvH7s34glZk=;
 b=sDArnVMZBpifwttICdvTDb/v1vGZeoLv6bCIKUlBeNvDOkCllPklxBHNi9DYfYpvpm
 JtyJojR9AD2mKDBwoQYfBDBsUD3eX25fujqyEgK/LV0UKnOBb4MFyG/1OUUaiW1pchA0
 xq46goiOL+oVGdMBU/ktCBPvxEmWSwKdffsUZoO1g2H13ybyAeNsP11cEvGTMDyR+JkL
 44hKP3e9jLPMNoelqpx7AXArOij8+3WfJ8tuLsTQih48L/idXyCnioV8PDqaojBpaorU
 eHPlIY9UU6UhaX3pnn06EZw5BCGJiCQkSsjKIP4BUxaqGmx6tymnSuPx6qWMMuyR7GOo
 wz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jxC0whbcZyna0ZKfC75qO3iWm5GcNCiXEvH7s34glZk=;
 b=mtiflwNToWcvN+35A3Ls+ENS35yrWhOzwOiY0tnrhRRHzAnM8jRYQoZyyracO999NI
 0JuKeaAvrzunmZkFlZs/hig4/4W0g1YVtj7ERlM42CsS7E4uO1Z+5n5Zja7XeLEoKcu+
 OtrhLfP+tX7FCcHsTF/JqfbKqjx3r0w+WtgjpdgQPu3irvhoTZ29I615i0oZEQPyQUzN
 zFeT2nLTECvdS133bf/WPlGKGeW/epR5LAyBQE0+MrWUrMiiXWvsd+lTy3Gl2VczDJvT
 GXLQj/sTsN08seNhVTnX2NbDsfbpJRO/oIHDpZ4vFF6uG+Jhjuz99hiiHrJN62H1uz8n
 FbfA==
X-Gm-Message-State: APjAAAWf06GqUHNP4DFII5MrlYkaIPaTXKe8R1+ynkJn5Yqp9RxoPFEZ
 QWNvIrBaRYF/KrSae+UiUwMcJpmCQM7zDw==
X-Received: by 2002:aca:de04:: with SMTP id v4mr7296853oig.162.1560022250474; 
 Sat, 08 Jun 2019 12:30:50 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id s63sm2141419oig.11.2019.06.08.12.30.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:30:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8afc1c6a-2675-0208-fbd6-7ef9ee646b29@linaro.org>
Date: Sat, 8 Jun 2019 14:16:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH 39/42] target/arm: Convert VJCVT to
 decodetree
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7VYBgGIO1s0l

On 6/6/19 12:46 PM, Peter Maydell wrote:
> +static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
> +{
> +    TCGv_i32 vd;
> +    TCGv_i64 vm;
> +
> +    /* UNDEF accesses to D16-D31 if they don't exist. */
> +    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vm & 0x10)) {
> +        return false;
> +    }

Lost the jscvt check?


r~
