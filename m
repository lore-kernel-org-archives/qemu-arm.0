Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11669780wrv;
        Fri, 26 Jul 2019 02:27:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxo+mHL9X/3FCiVHZSRESRvUsK7kwrav2nyPplMhvFewG2XetDv+Mhbg3IAlD7BT8ByJqcB
X-Received: by 2002:a0c:b163:: with SMTP id r32mr67917944qvc.169.1564133228987;
        Fri, 26 Jul 2019 02:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564133228; cv=none;
        d=google.com; s=arc-20160816;
        b=sH9Kv4GWAwlD3LW8V0BpUfDY+PO+lQ3qt4P9TPAtWSEzGqjgTBb/t9sMo2xgvt/NZz
         jaNPAgmuHA3v+TBeIoVRXFswAIonM8Hg9xAGbNzrAbUymH0YyzA7rP6Hr3NbRhvaafnC
         BQwRROZ8aUPwkhvd9dNHiMX8jGCtLQ01gwk/ZsCZw6RcJFdcfxsmhsSl5eRxZ3/6irZX
         T6/o67kc9t6aMa5Lml1ROTKc02x2Cqw1qunhzke1wT7OfNkVM0fGPurO2nX3Kc9z/N7w
         QneWCJhmKERHbg3VgEdGC+q4D+Fnee+YhW4jCPk/p0fEb0/4Hv39/WXbS2aDsrahEAzI
         Iotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=q+oWH/lOElaqbnOZuAMvJ1Z4i+kZvaUG2j2o1tOHmT0=;
        b=HhqDkWbJmZQ+5sFH+cYabGEjOh2wYdOsdx7m//EllryATGay804A3KpR89WhGM7LN7
         DYkYwXdYTMeNpKOEPVedgrF4oGaJvhehEkIS11oxop4jEpbR+sffXwF+3hCgVXRs6pdI
         WsXtqBs6Zxgg0bd/quUOBl4dP8FtCCyMbjmfJ630oaQWq9bdctZNvzggcafar2ZGQ1m/
         62KQICOwJ4JVxv8BvDg8ZaiqzFyK0NlCWIl9kok/DuO6FFzF5yBjTALTqP/FNJALDr/a
         f1IU0wV/Um7wmcNn4wLiwhzGj8NSFF+BXMmsSVzCODPYWx8G8ref7ItKcW02h13iWje4
         kr/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u34si31987101qtj.301.2019.07.26.02.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwVE-00085r-Cq
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51375)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hqwVA-00083v-Nu
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hqwV8-0006LS-NU
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:26:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33273)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hqwV8-0006By-HP
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:26:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id h19so37578526wme.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 02:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+oWH/lOElaqbnOZuAMvJ1Z4i+kZvaUG2j2o1tOHmT0=;
 b=JGEVbxOLLh1Sa4QhNoZx09eyW8RoyaY7WyrKePCjtfw1npxasJGoA8jPusbjJwYPXR
 H2AWjbWFJjEeza3G6CgxoysznMV6MeNqI8JII5mqy7V3dMdLxTtYkktzTBV4B0ZJeYGK
 FHm4Uj0Rq4zXMY1vNal447IHos0/mPIjI6j3F7q3Ize62cZlBIhTDhChn6O5PILEm0w8
 8yHQoadZ7beWtXH1WbxeU+UION25gB0dnvI5mbyz6xj7RoXk/W9TeGKiMJ+9UZvZ4egi
 WFHsFFcaI2dMhNke1T8gREchyA/Qs8SvonFJ8TrbLWVDYmYwrSuinW7RYm4u8CAUdytu
 vneg==
X-Gm-Message-State: APjAAAVmilNytifRAlC+VWZTZykbCTVg83EovYjTIX+n3l+eij4lR6Cn
 RjeO5Q/MWaKjYAJ9hBLvNLBj7w==
X-Received: by 2002:a1c:ca14:: with SMTP id a20mr42211047wmg.71.1564133215103; 
 Fri, 26 Jul 2019 02:26:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:cc23:f353:392:d2ee?
 ([2001:b07:6468:f312:cc23:f353:392:d2ee])
 by smtp.gmail.com with ESMTPSA id b15sm67878742wrt.77.2019.07.26.02.26.52
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 02:26:54 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123667210.66446@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3a893408-e864-cb3b-d86c-b6cf7b50cc39@redhat.com>
Date: Fri, 26 Jul 2019 11:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123667210.66446@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 11/15] memory: Single byte
 swap along the I/O path
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gxHsR1i/uZhl

On 26/07/19 08:47, tony.nguyen@bt.com wrote:
> +        op = SIZE_MEMOP(size);
> +        if (need_bswap(big_endian)) {
> +            op ^= MO_BSWAP;
> +        }

And this has the same issue as the first version.  It should be

	op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);

and everything should work.  If it doesn't (and indeed it doesn't :)) it
means you have bugs somewhere else.

Paolo
