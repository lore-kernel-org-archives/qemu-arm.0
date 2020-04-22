Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp181112lfm;
        Tue, 21 Apr 2020 21:14:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypIu9HW/cnSQxdG/i6SP14hOuf/mc/MVnVyZReuZXvBhDoPLmO6t09r2R1Bb7SDe6uLPZGvF
X-Received: by 2002:ac8:6d35:: with SMTP id r21mr23596751qtu.210.1587528899334;
        Tue, 21 Apr 2020 21:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587528899; cv=none;
        d=google.com; s=arc-20160816;
        b=sbFS4Up7oTQ1RAMUGr0XopbyBj/ofjbdLKQo1RG3oYAkfCrnsUZL3kYO2FpmMvZZvZ
         fEtmOpQhnoEvA1ZYDtNcxvDpVn8YbFCO+GspdMXboAX2INFlquzpXokgUQ0oxu3f5ZhF
         RqCdsWcBJ+v4k2B9tNOqxM6BQcKp62V2dpyhJh8aGT4iJFWdzpyDCfk0rBY96Bn2dHWB
         k4zzBngETWVNUq5KzMDC21jn5WXvFE7LymmW38mjwkqK9Tn7w2tm21PuJBvr4IzyqfR4
         4t0LrDglwAiHts8Y0/yR2fwqXkjYVdYMjqc0p1Z0Hz+Q81xFtvR1MULwqRuo/HKB0e2v
         R2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QS3Gwqb+cA2Y4B6bPxybgl4EXvBvpjVilRCCI7CC0+o=;
        b=vxA0DcSZTZ5aFbAG7nLUrBgmqipZbxp6Ed9jBlK2ujdOR3vU4oH39YCv3XhnK+ScJi
         8Nj/+hV6TM9KAR/hjCPah3k/gL0MCNPEsNInhEln3NWoKonnv2IqNVWco7dJgQrC1d4P
         j7WWIv8ClXE7dySdYWzdDM8tJg+vWA3NMbi5kmHe4LxicyKBaptcbk8AbYxsDUX47lMZ
         kNs25/nPH+loM1ukTXSb0G97q1A7d4wE+DNyOXX2a6eDRLgVjosYdWyfDu3RID8Qte8H
         SLWqIYAY4kwGk9+E6Ct3Sfzlf5u7oT9dtlKYVc7+FzLu+Zd9dySTh6JRNY9QOZ0SEXZN
         TMCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqoU5xOs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si2709693qke.272.2020.04.21.21.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqoU5xOs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR6mm-00082Z-Lw
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6lK-0007bq-IC
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6lI-0005RJ-Fo
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:13:24 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:50575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR6lH-0004xK-T2
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:13:24 -0400
Received: by mail-pj1-x1044.google.com with SMTP id t9so334554pjw.0
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QS3Gwqb+cA2Y4B6bPxybgl4EXvBvpjVilRCCI7CC0+o=;
 b=uqoU5xOsMSyT+JAn5HT64zaL4csqP+qdXIlqG5S6PGoOMm+k89Wea4ORl+xQskRuEd
 t4S1r5z7wObeeZ4NmRuxqZiuIPKZni5vKsFIUXYgVUGrUoFodBlFfrStvNrf04E4630i
 lw4VM3WcYJZjb6mxJkR4mwz7w34oZZX3rpFOdQa31f+brCUD0iopI3pN2znZjh5TsMYS
 op69GT9U3OBLX1SQa0RAZUUCT27Ix/Z9DdRQWnZIeu0AVZ5NVar7EHeYtanW+vVjaGWZ
 0VHozpYjKbSqQZiNJdZZPjDs/dEXY8OIZt+CHg0sxaBZwHDW40F+DGQjidg7Zy3JWC4j
 Bh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QS3Gwqb+cA2Y4B6bPxybgl4EXvBvpjVilRCCI7CC0+o=;
 b=Oa/7g12su949i6HgPN6bCY03tL6pksXMok5lysYPJnYm/ZlGopmUyE6fSiHc4ocaEB
 eK4RfEKfVgaJcPvrU2ygmHmJQbobJELU0Tdyj523dFc6dY1Ci1nB+yQfzpzBGslTX+O5
 0tAb+DEuGwQlGrJxuq+EeLoUTAP7n40LV59DH58r/5MIWp83krY7iwNMW/89eT6XGb/U
 ERIMtQ3av8UgKErk/BUeJQLxLZsKHnB3WlkDY0F1Clijlwzk7N7nyjguZ94t9gdm1j1g
 PIJBha6/1Dp+256LIpIf8EcFwYcxw2pHUH/0+XmwQC/oC+UZ46i8yk1CWLENf9E5lLJH
 S9nQ==
X-Gm-Message-State: AGi0PuZa5qePw4eyxrgW+sVCypRguLJEvhhL67ibTn1bEmUYoLsqy2xG
 vSGvC1j92PyDR4ms4BSn6sE4wl2ZwpM=
X-Received: by 2002:a17:90b:3d2:: with SMTP id
 go18mr9615587pjb.142.1587528801303; 
 Tue, 21 Apr 2020 21:13:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id y21sm4002404pfm.219.2020.04.21.21.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 21:13:20 -0700 (PDT)
Subject: Re: [PATCH 1/6] target/arm: Restric the Address Translate write
 operation to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200421131926.12116-1-philmd@redhat.com>
 <20200421131926.12116-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32b0de3d-cc23-1758-f9b2-e51234706a2f@linaro.org>
Date: Tue, 21 Apr 2020 21:13:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421131926.12116-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pANzHnYth+op

On 4/21/20 6:19 AM, Philippe Mathieu-Daudé wrote:
> Under KVM these registers are written by the hardware.
> Restrict the writefn handlers to TCG to avoid when building
> without TCG:
> 
>       LINK    aarch64-softmmu/qemu-system-aarch64
>     target/arm/helper.o: In function `do_ats_write':
>     target/arm/helper.c:3524: undefined reference to `raise_exception'
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Better explanation:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689388.html
> ---
>  target/arm/helper.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
