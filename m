Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2446763wrm;
        Sat, 19 Oct 2019 10:45:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHQmZg8pgxK+6qb+grhJ0/ERpwF+E3DRo3KUwLgi9+rhomQVx7TFGbwUH22amRQzSteSxg
X-Received: by 2002:a37:4d88:: with SMTP id a130mr7606547qkb.28.1571507159465;
        Sat, 19 Oct 2019 10:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571507159; cv=none;
        d=google.com; s=arc-20160816;
        b=zUlmjdHAZAtEmKeL7hEvdURL7W5TGYuaNsJI/xEUhwyXXEiwmgonUaI1rPz3h+e7nd
         5XIM6i4QcLTSF4tDrGSxTUC4fsbFnAv1QHAygs7waYF2/yYQ2noPqA/d6jadJLiwU/yM
         u0WcLAJKsZB1Pjqre4pnBjugoyGhZPbgv3jYjy2jbiNdPapBSoTMqMQm/DZVqyu4y4/o
         SpZNNIwfK6mxzFes/nKW3bbuZw1pU2k0ITHEhTKXxxAh23qKaJzzxBdoi6k04AvHLSJe
         9sFX4RrjsScDC6MBSKDj6KsNbtMsHoKnD9cjW9qY3aac+iDDc0QfnVvtJC/27HDjB5gV
         o/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=KHSIygB4zzhMEbJa2KG8tJj1wPq0xzJaF8Bz1NksvPI=;
        b=yo8HOhTRtok4w7ewVcaP6EAPNwvst3/5j9olDapymrjvQis/2GRcpeJ9UdUi1xJ2m9
         i4OeKjh5lncPRoBq4sqb0AxqGVwL/px16ukTYOZZNUfmk2rE1w3QLPOVUgRuo82Adbmv
         UV11JK1jb6gJAwMAmce9roVUJZ6PLqnQryW6ZMbKiWw6Xll/BfYWNefBpFlocBifsF3N
         Z0HKyTbVgpt9NKAFuMmaYk4vFRsA4BwmMemlTTGhEB9sKy85bfOhcl23QENJbwiC4J+n
         wVAMbLHbfZOF5xn6KX/vqA4tydA2AIIXCDz03cdswOJBF7Yuve1g0z3Qk2XhWxV6HZSR
         z7Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VUkdFscZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20si7051010qtp.243.2019.10.19.10.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 10:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VUkdFscZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLsne-0002UV-VV
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 13:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLsmL-0001v2-Sh
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 13:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLsmK-0000If-PX
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 13:44:37 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33047)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLsmK-0000Hk-If
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 13:44:36 -0400
Received: by mail-pg1-x543.google.com with SMTP id i76so5161516pgc.0
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KHSIygB4zzhMEbJa2KG8tJj1wPq0xzJaF8Bz1NksvPI=;
 b=VUkdFscZ/Yr6ub+1mhO87QtueuQEspuez+ZNJ4pEaBZ7+Rb7F38ByD4G4pQu2g45+w
 MhZ3Z5LtH45VnU+gGXiCO/6ceIQUrdvz1TK2TzunJ9fU8qzhlrLJ8m5oJFlriiqbAvQH
 K/nb1RoIogh9c/Etqi9fWMXax0RpGrVXxPlZr68WsqmZNKTo5vVeVBihTTIKqCY0cJmi
 oe8MIIkTI5qw1c2HzaFBZhAUgUvne0HCXAaS2kOWrWQiOZz41mu7YuinJax53hKxjTk1
 BjrVKbo41xqv0Q4CbrpBYxFi3BAHA3K9Zpmsfyr8v2QfeUg1oLX+QCryY8KwG5IMMSoe
 8IEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KHSIygB4zzhMEbJa2KG8tJj1wPq0xzJaF8Bz1NksvPI=;
 b=uh3aunYYUMVHy5W5iP6Ut4aEDpeofl5JEXOs77Hx4SPhj99NtqEeS8SfsricP/uH5S
 MzO44i/txGI3+OV+IzkA788hV9VDTOKBeBZR7wmktLC3JQt15ZwSl2HDdzIvCtV3FXBn
 kFkvhWXA1MvRLBHdWvcKRJAb5/+QguRC2zaxwAVzr9VZofC4id7cr+tuAYz7XKpxU6av
 QuHF87VFrwkCzzv2MuqsPRkJzPd9gRzT5vVyHxg+/NlyLtVpPlT8CjUvhnob/nd8N0pJ
 eYPcgxlGVClrh+TQA7qL77fSLJ7XTYLc2cpnI7fSJ2HmHOm0UAaI6YPrzgCRnbDPgoaj
 ZThQ==
X-Gm-Message-State: APjAAAUxTnL18ypg3U/d9lo/NyeHc4enDyV7PJNCEe0bs4oFTvp5bwuk
 btWL0DCqk6kYdloLKdTxS6HDvA==
X-Received: by 2002:a17:90a:be15:: with SMTP id
 a21mr18427636pjs.52.1571507075229; 
 Sat, 19 Oct 2019 10:44:35 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 127sm10059517pfy.56.2019.10.19.10.44.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 10:44:34 -0700 (PDT)
Subject: Re: [PATCH v5 02/13] hw/core/qdev: add trace events to help with
 resettable transition
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-3-damien.hedde@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ccce0e72-c4d6-45df-1d89-11697d01b2f3@linaro.org>
Date: Sat, 19 Oct 2019 10:44:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018150630.31099-3-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, edgari@xilinx.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8TssRGd0FtKy

On 10/18/19 8:06 AM, Damien Hedde wrote:
> Adds trace events to reset procedure and when updating the parent
> bus of a device.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/qdev.c       | 27 ++++++++++++++++++++++++---
>  hw/core/trace-events |  9 +++++++++
>  2 files changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

