Received: by 10.25.0.23 with SMTP id 23csp1178427lfa;
        Fri, 16 Jun 2017 01:32:34 -0700 (PDT)
X-Received: by 10.237.62.208 with SMTP id o16mr11381381qtf.4.1497601954883;
        Fri, 16 Jun 2017 01:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497601954; cv=none;
        d=google.com; s=arc-20160816;
        b=01FJUAZz3c/+SaFlfkFdWvcZUgeHMWxfGSHopO3eA0OKfZfMNf1f19VhrDpDlELq4Q
         k641TBMBTW8SI9/i8dXc53EAuyZ799YBeTqPdqBy2FsBolzI1vLttqy/OVjWOK+zRE/z
         2mKhQOjdu6gKs5ddp8cqkxBf7M1guVGeQ+vabU+OqhKnaG2Tqw4kWj1dfmGdhuR2G+KP
         h4Ugm9vc8Z4KdE3PPZRA6NJlm0hcAfyYuOMQM/VIwQWQQGHFVk98B55j1WdeAWcVXUz1
         y8pIPb4jkFUJAsUckAUvpR5eZw/xB44337vV1EDqV7IHFvW8D8ginZ5oTnm3b8yZ2Tkl
         D0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=i4YjOP09xYKTcqGPI/sF5UkFeMXBqKs7zYDrUw3zxME=;
        b=Of+wmch2MxwT0iBpZdDEe7Ao5jru8DAqOU2vdMouEU8l+9o49gYKFZ29mNXxl+mESX
         wG+CcgJZ9+oyXAbyjSJBL7PuzCHisw1x6OCgsiZfhDiM5QryFi6stJt7PAEFX7DgUfxm
         p4+U1fhioT4oCZHbwDn8aNDnU6Pa71Q3zgiicNbrlWcs4phFK6IKuKDiv6Rh0QiqEyj3
         w4r0AGG4huN5PGqBId6J/9dy4n5WQsAeub0rIlDdrV2M8aFaqM64Liq3ECK5ECgjyf8u
         145Np/x8x7H4dsTOj6xv/cYLXXjPpaNtEcilqtMxFlmobpWwVY/tuiUfqMJEIv7WtfZj
         2m8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si1432636qkc.340.2017.06.16.01.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 01:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLmgC-0004Kd-8v
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 04:32:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dLmg4-0004K3-41
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 04:32:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dLmfz-0003fl-5G
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 04:32:24 -0400
Received: from mail-wm0-f54.google.com ([74.125.82.54]:34936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1dLmfy-0003fK-UM
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 04:32:19 -0400
Received: by mail-wm0-f54.google.com with SMTP id x70so19353380wme.0
	for <qemu-arm@nongnu.org>; Fri, 16 Jun 2017 01:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=i4YjOP09xYKTcqGPI/sF5UkFeMXBqKs7zYDrUw3zxME=;
	b=FGnJRuyjdUOfT9OUgq3HedV58VBUd00bCePY2+kvy3MVtPNk7kKulDy+CcdTNDaGqd
	T5yuBkxzdMiScGX00KnkBrf920ejpqic/5YsVgw4reHvg0iOghBY5dTWGu1mAaPY9qQV
	YvW7Gpv0XOLEWGfK/jxI80iGal+I+UXPxLynjiIPO+1fT2zJV0WFXX5uscLDhWY3RsqF
	YPFfdr7GvDVHweMsUHhEZmEBj/KgHMBY9S/x+1TqypG4s0+9W7oEohbqzy/xzE051rGd
	Bb6Q9CPswsJvWt68Id0NhZkOFA9qlL/+1zYb4fRrq4lNNvrDr0szJrF1phEGnUAGBONX
	H1nQ==
X-Gm-Message-State: AKS2vOwhK20DVutjSyprJO8SCi3FgHimNqDyyL59lLmdwDDYlFqfh38/
	NmDRbVKM7HdkcA1v
X-Received: by 10.28.193.137 with SMTP id r131mr6127785wmf.59.1497601937794;
	Fri, 16 Jun 2017 01:32:17 -0700 (PDT)
Received: from [192.168.10.165] (94-39-191-51.adsl-ull.clienti.tiscali.it.
	[94.39.191.51]) by smtp.gmail.com with ESMTPSA id
	g203sm2883749wmd.23.2017.06.16.01.32.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 01:32:17 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1497567879-13734-1-git-send-email-cota@braap.org>
	<1497567879-13734-2-git-send-email-cota@braap.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <df6ef6c7-6bb5-a509-5e8e-66757598b11f@redhat.com>
Date: Fri, 16 Jun 2017 10:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1497567879-13734-2-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.54
Subject: Re: [Qemu-arm] [PATCH 2/2] gen-icount: pass cpu_env as a parameter
 to gen_* inlines
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JXjBKMuXnCOD



On 16/06/2017 01:04, Emilio G. Cota wrote:
>              va = dest_gpr(ctx, ra);
>              if (ctx->tb->cflags & CF_USE_ICOUNT) {
> -                gen_io_start();
> +                gen_io_start(cpu_env);
>                  gen_helper_load_pcc(va, cpu_env);
> -                gen_io_end();
> +                gen_io_start(cpu_env);

Careful, looks like a cut-and-paste issue here.

Paolo

>                  ret = EXIT_PC_STALE;
