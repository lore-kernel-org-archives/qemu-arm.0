Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2593305lfm;
        Sun, 21 Jun 2020 13:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd3rqs8gt34p68KsD/GLobFHlaOTrUifCm+CBbgveZMzrYNG4OY+FLOJ7BV4hIerEBYT+p
X-Received: by 2002:a25:c08a:: with SMTP id c132mr23078720ybf.118.1592772650673;
        Sun, 21 Jun 2020 13:50:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592772650; cv=none;
        d=google.com; s=arc-20160816;
        b=Ylew217kmyjeWG/T4k5ubsS+JotpNFgHvWjwPej5jz6k56k5DqpCw0NfLTApYaA7w4
         Ze7z3EtFv2jBKBkeMd48ZIXgJH6fICeuwsb7pOytnwoSVgNxGmyrpSUX1IBnk8Q+N6F2
         91RRbs16ChPEpYS6OGd4AKybBejDX8QMjhZhRcrqaGR1C/CapIX2sIELsJtG1KPGsVvg
         pnINteBiWDqWRp/GP7vZKuDdF1iNSOvXX+Vwhn+KDAPHG/ryQhC2MAA8oMww02RaoI5q
         hA9rvIghQ+749akAMZMTtsaoSCUJXdmwLv4lK8ufS5L52Cq9ktWTOdYozi7BjQLSjWqD
         Vz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=brCHUk63udbsRIT1D97INe01gFK0/4E9rOQ0E707l+0=;
        b=JSPOIPStfUYKschiiX46GAswDRp3YzXpJN20IOG8T8OkbGgru4oXskWSp7orROdRqR
         rBaDp4F1g6mPYdcGzLZieqX3ob9l8w0ledwZ4VqXwvBZDq0esdNKjXJfSU+VaMhH19qe
         VjDA9ue66UhUCwhJdsGQo1YSCw2B3SRV3rLy648nNzX0IQ0WnL/6r6rMCpINRArI7yzb
         zQflkyOqYnmS9K9BHBzLjRRiVCVPkH1oFe4vHPLRPtLSEY1Adcyg9RkqXwGM0sGJNia0
         5H1xbkNwvqKBSjzCaUL3ASCTr7oXlWeVf9U5acgmFj/KJGc+v7UEfOrbVshSGGU+Npbo
         aBBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MEfq5GJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si998543ybc.326.2020.06.21.13.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 13:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MEfq5GJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jn6vS-0003iS-1f
	for alex.bennee@linaro.org; Sun, 21 Jun 2020 16:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn6vJ-0003iE-2a
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 16:50:41 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn6vG-0003fu-77
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 16:50:40 -0400
Received: by mail-pl1-x642.google.com with SMTP id x11so6613072plo.7
 for <qemu-arm@nongnu.org>; Sun, 21 Jun 2020 13:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=brCHUk63udbsRIT1D97INe01gFK0/4E9rOQ0E707l+0=;
 b=MEfq5GJ3YupQremSCFQF9xA9ktJsVcIlQWt3m7GFHWWUAVGhOSFYEHmjuJL/tLFLu/
 DUZXO+wU97HaVWD4aIkiCHDQnl2LZYQk+oUYm4cG4iIMh/A4j+3jZaMIVzW506+VaKgF
 Jr5BPL4rFk+bHk7uk3aGvhRS8lXTJFBk/LgPygdZKuxau1tKt4vv7HS8k9UQwRkwUtF9
 WSIPmF+lYygOB9UJ7Xs/tyZdoxjHuCnPdG1f6ltwX+decYQ4T9kZ6Bntx+m+6VThJ+8l
 539M9DTm8l2I7hNAFl2+gdjrNJPRdN3AFS/w9VjvmM97T9daIYaHcw7IPmi+havvFaun
 kHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=brCHUk63udbsRIT1D97INe01gFK0/4E9rOQ0E707l+0=;
 b=M2b66BhMi7Q1dwccPmOmlnCW9FMgtD1d/K62QW4ajTIzELD2eZRFjswKrn4jtD40X1
 M9ao4BvfxXo/1sc+78AjGNNepHOSVrq8l1AXsykEu4UP8hOT8fp914gZ2xrF3X78NfRZ
 eUHfhBIa2LOja0GAo+7SzHSKRWM/b2xn4yO4rn/OYb2vHqL/6Wc1j9a9WzDlNHvFgKpu
 grqGPMQ4mm8SujWc3MfyQHYhltNyIC5QGF0QEyPR9o7Pq3tYuDOX8yMkm39ol7ir5eI4
 uNCmGi320yowRE/18GF+7/ie2ovY2xcz/CxicYYWFhYSSVbLFWC1raZB4tCBo7R8ct2c
 4xEQ==
X-Gm-Message-State: AOAM533CXDze7zMbzOmD6MwopbTkOsmW9pIot1f0/VmDninOPg63bV0z
 AxaC8hQUtIbBSVgzmMcEKbxtOQ==
X-Received: by 2002:a17:902:599a:: with SMTP id
 p26mr17578066pli.322.1592772636497; 
 Sun, 21 Jun 2020 13:50:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h9sm11918736pfe.32.2020.06.21.13.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jun 2020 13:50:35 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] hw/misc: Add a LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-2-f4bug@amsat.org>
 <f2cc97dc-87c8-5cc8-e0fb-026cf80c25fa@linaro.org>
 <dfe79efa-0f77-6e86-c7e4-42fed7756071@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <134beb01-c080-1d37-a127-83d02a390cd4@linaro.org>
Date: Sun, 21 Jun 2020 13:50:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dfe79efa-0f77-6e86-c7e4-42fed7756071@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7OohXgEjPT0

On 6/21/20 1:35 PM, Philippe Mathieu-Daudé wrote:
>> Is color especially interesting, given that we only actually "display" the
>> color via tracing?
> 
> The idea of this device is to easily visualize events. Currently
> via tracing, but eventually an external UI could introspect the
> board for devices able to represent visual changes such LEDs, and
> automatically display them.
> To limit the list of representable object the visualizer has to
> support, I prefer to restrict this device to the existing LED
> physical colors.

Ok.  This does suggest that we do use then enum in the structure.

>> Indeed, why not insist that description is set?  If a board is forced to say
>> that the led is red, should it not also be forced to label it?
> 
> Because when we don't have access to the hardware schematics,
> we can not specify the label. I'll add a comment about this.

Well, if we don't have a hardware schematic label, then we must have the i/o
pin; we could insist that the board label the led in some way that makes some
sense.


r~
