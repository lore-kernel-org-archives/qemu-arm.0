Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5469198lfm;
        Tue, 14 Apr 2020 14:40:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypJY6+3SyCz9jFa7BjEhMGRg6OQGez6WK2ud9uwG00OdfqseRUs0Z9xhb9DSItzY56O0rqGz
X-Received: by 2002:a37:7002:: with SMTP id l2mr23695752qkc.372.1586900426060;
        Tue, 14 Apr 2020 14:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586900426; cv=none;
        d=google.com; s=arc-20160816;
        b=kWxG/hYtQ6aXdlBDJWgiAyWUdFCAZOICvDTES28ytpuoMycbqdbOt2bivPC3n2RIzc
         htvGLZZXmkQ6ZjXW+YavuOb/Ulj767P4m0IX6hIZwff1dLb0YjZgDz2/cDyygblel0sL
         g3l6FkFpy2ksrB/eyCsj4a/+2pezbr1iVVd4Oc9S/UJ2y7e6dtCrDmWFjlLfmESb8Dp2
         c/AjRpP0Q6+jIfV2YSQwORlL4f6CFfY178yBnmFReIuk+yk+zSfSLokV/D8pmO4znBSE
         CFdOvRGjWM7+52Ub3gcVZXUSKy6A2dB6zkJVUyMGoWk8s4M1rYT3OBLWnuzBfk3DVsRD
         eabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+YdJ1eItjRB7ItTRPS1yzNOPMwATBGKtFqeGB8AgldY=;
        b=qsGp3vbNMtAMjaBPVZc0aHbOskvarSeSe2BeHTsQq3SnD8g/CkU983z1fQrB0fn0Go
         2LkVksUPY8rC5soW2Is+0kC6O9kOCGHay+/pbdrlozSLdBGXnXr1EoJrLbqTd3Hg233G
         uxZeb2WEkrVWfCl1MuWcSr85QWrDGfG13POemNIA+v2RKePLazf/HTHQg8bRvaZtmLPz
         AblzFdLS4JSL2XMpOtsRuEnpNHqKqOWM5894tKoOVtZ/pYSCN9GZdskI7EzVF/epNiqf
         o/6NLviy5Bmap10gNQiSPr5zYM8GI+KxvYRFz/CHVQOqCt7XCN5inFL61BFgbogy5rLR
         GU7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h+Eo7Snv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si8158822qkm.183.2020.04.14.14.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 14:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h+Eo7Snv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOTI8-0006xY-Fb
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 17:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jOTHz-0006wo-VB
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 17:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jOTHy-00082C-Rv
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 17:40:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51186)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jOTHy-00081V-Kw
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 17:40:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id b7so5885565pju.0
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+YdJ1eItjRB7ItTRPS1yzNOPMwATBGKtFqeGB8AgldY=;
 b=h+Eo7SnvIra0gg12SjTsJNQK7hUY+z1MG5p0nKh/xlrWsdcbkSQRExUNzO/QuF5LBq
 nK+gerPPGcDw1dky7bWHAqeQp8QM3oxsP2k5TFzYVWzZkjJvZT9B0G623T5XtGX6sISR
 AsOK2k9fq0tA6tc8Xrq91NmtabQMcdJr3WLFXjdE/qGCKZCOnri3+Ys0GnKZt3ZYg1g5
 KvE9GdB3QSSzSziY7/SdTZZfBh1MYelqsMXUNXL7f1BUMIfWIGiSP46OQMHEcZENFaZt
 OK716l6AJ5iNivPu5/aXilPD2ztEdkBYE4E+00VClFsmzjbpDFgWdZnftHI0I4QwhcQt
 l1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+YdJ1eItjRB7ItTRPS1yzNOPMwATBGKtFqeGB8AgldY=;
 b=bdAjW+3cJMndBVcUlyTSaRgn/jyfKKVB/TnqHklE7xIKjXQvnxT5e3HtbaHoJgm37t
 lqN57bfVGFezrayxnKPRuOKbkewc/rNvgXYQskfodmzZ+Y4YELh8wpmX/AUF3sp1Jec6
 KnCMdjNVLGtz5cpURqEH0QDa1UlPpmkpjxL5EB1ki8HgPTj/2Ke98rDo0JL3WEoo5E+V
 Em7OdKVXxDumZAveD3VQa2CWfj4g79w9WBQKpMolCggaJK3IpHigBUt8GANPECgfmYnJ
 SpBf8hvuBwfn5Y/3df1m9vy5pZkGcM86jeTiz0Z8PihrM03/10+ECMEZfe6RG2yZqPKE
 lwiQ==
X-Gm-Message-State: AGi0PuYZ4pHKJEWfagL92as7Wjlg4SEp+GSAOFwbINYIKtqP7VwTnwSH
 NwrdAZ8ny4XefKwKnlPf0OYrDA==
X-Received: by 2002:a17:902:8d8d:: with SMTP id
 v13mr1951273plo.260.1586900413217; 
 Tue, 14 Apr 2020 14:40:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a136sm9012385pfa.99.2020.04.14.14.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 14:40:12 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 0/3] various: Remove unnecessary casts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200412210954.32313-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1478503-cab3-df6a-1aae-50b262e9121e@linaro.org>
Date: Tue, 14 Apr 2020 14:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200412210954.32313-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1035
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YeCzQeM+G+8v

On 4/12/20 2:09 PM, Philippe Mathieu-Daudé wrote:
> Remove unnecessary casts using coccinelle scripts.
> 
> The CPU()/OBJECT() patches don't introduce logical change,
> The DEVICE() one removes various OBJECT_CHECK() calls.
> 
> Philippe Mathieu-Daudé (3):
>   target: Remove unnecessary CPU() cast
>   various: Remove unnecessary OBJECT() cast
>   hw: Remove unnecessary DEVICE() cast

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

