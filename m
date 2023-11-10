Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1120679ejq;
        Fri, 10 Nov 2023 03:28:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNbdrxn9z0zj0UOJ/N6VDQaD4FAP5xToewGRrsqDt8jPK3zhbEa8cQUwyTp4jN0JPn9w7s
X-Received: by 2002:a25:ade1:0:b0:da0:3972:a062 with SMTP id d33-20020a25ade1000000b00da03972a062mr7784645ybe.39.1699615709604;
        Fri, 10 Nov 2023 03:28:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699615709; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWHPyLIdSY7XrHlBpGVPBTeipMXP8IZZ4LOOpiDx4NUZ1iVx75kx1WaCG7ajUSnxfJ
         1B3LQIJTF4iAcNgVwFlXjYNepGrCMV0/v43AMT1GddTSCyOWMjnA0E2IuQgdeztxy+6/
         eCZyYi0lu3l09xbqOXpw46JayDM35xMwpcKSOl2xn5WnwIfiHq8sQZN2zrv90rN1i6uX
         F04JfCzSUfySlWedDWH9TYgJ5l+qqKNzkHnrxQIxrzsBTCBZCK3AgtEMX4XTQw5pD9we
         5aL+yNOkSoN/LjOQAGTfi6qy3nZM8HaGLhV8IqwkW26B25o/YQ3ttcXwj/hamM8GVXW9
         IR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=x2cJf8U8zq+7Qc886E7RORcVF/kML0kHxdy9k4APJtU=;
        fh=OcAfL4ePqegSIuc/SkP+wEx+Eq+N0qKdP42puOVug9I=;
        b=C73TkG5+GcziLmDbyA0Ws20mO9MGCb3XPHtHrYY0Ip9C0YQX5J3RT4xycH5nXO1KzF
         HUygvYn0D024q7HSYEz5QeAyr+rSN0TpAymM2jqmXenm4t+KT2MEEhsIM7JahqgPq7YZ
         7SCWbsV/99j4h31OEDFR1ucvRf93zxnQht8NHi+niHhIR8+KR20eujEN8VgBjfevsxEj
         Gfjj+6X5unJdcBh8lINgUlPp5VAjZKkrkTJOATsqRV6uzNk5Dp8/TjqDPITBpmFN+rPi
         te32XV1MF/ga2FSY+QCokWwQhbf3KFG9Th/VM6HJTFwJZ3FC4IaNubbJNX6o/Rsy8yhd
         gvPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVBjluGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020ad45f46000000b0066ac82c4487si4760233qvg.365.2023.11.10.03.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:28:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVBjluGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1PgP-0003JW-IP; Fri, 10 Nov 2023 06:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1PgL-0003Ip-2W
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:28:14 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1PgH-00066q-6s
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:28:12 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso26421491fa.0
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699615684; x=1700220484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x2cJf8U8zq+7Qc886E7RORcVF/kML0kHxdy9k4APJtU=;
 b=lVBjluGrZXpb6ZIladq35o4iVt0n7YXmJnNcOpJp+2rvMpABEri9gY6qawKFTEI6Ya
 ylwKm8nGjZJnjww90KwOn85W9doAFghVfr/BAhuzyBaXUqsyBlgaG+zOLe/1dIFPhn5v
 9SxFUWgye0mN6GMBheqpZOs2kM2lzCOIrpZrPqsbOqvIr2ixtqhdnA4tyn//DEtsxVVv
 tfppk6RycTJ1AeNukvgciFOho8BPKTZl7kO8tAcX27cj0RMg0OoEL5ljty7dhjuY7QZX
 wao85Ck6EaWmwceI9kA4NPp2GjZw++hon+MRlWfypvtkqRkCiFPRtLghcNRozYR1Awua
 w4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699615684; x=1700220484;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x2cJf8U8zq+7Qc886E7RORcVF/kML0kHxdy9k4APJtU=;
 b=QkxVDBw+Usp4nkF4j1uWZWRvX8gPvbdCzDnNbJYqs3kTN28hnXM0vNnE5pamQATpqA
 ro7akbzdZluJZ4ClIPrye7rCH8mZQuTq682tkwNKFYLmq1RDsmRn7MdOq0M18xOErQnA
 +6BXYM9XdN8ONgvTXQbrsiygDSG7ANtq3E6NdeptKoUEvpP3wZR+tJBdZH99mzm8iv8L
 wIkwgrX1bYA+7MFsy1jtJUS16Yr+zPaeQ9TnhkBTZk6tPQyba51Vs3V+oPyuybhqe08L
 OEhha0XTpaePxBZ8v20n2tilxioKtlonBP/wQ2lo/VR/lszui6cIJ0GPNob5I1i9xrLU
 13nw==
X-Gm-Message-State: AOJu0Yz1dwuEb/aTSGFfh6BJhJ3RtpqFS6sZLMBlWzoFEyDu3QTAzBTf
 +bbPufWHFHH6mZNIUN1NbrfJlg==
X-Received: by 2002:a05:651c:a0f:b0:2c8:3571:b08c with SMTP id
 k15-20020a05651c0a0f00b002c83571b08cmr384477ljq.53.1699615684521; 
 Fri, 10 Nov 2023 03:28:04 -0800 (PST)
Received: from meli.delivery (adsl-109.37.6.163.tellas.gr. [37.6.163.109])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c138800b004075d5664basm4975761wmf.8.2023.11.10.03.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 03:28:04 -0800 (PST)
Date: Fri, 10 Nov 2023 13:25:56 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: "Daniel P. Berrang=?UTF-8?B?w6k=?= " <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marc-Andr=?UTF-8?B?w6kg?=Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
Bcc: 
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
User-Agent: meli 0.8.2
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
 <3wmne.fhuf28sb5yfg@linaro.org> <ZU4R+08zuo8xvlg8@redhat.com>
In-Reply-To: <ZU4R+08zuo8xvlg8@redhat.com>
Message-ID: <3wnuq.xckj65oye27@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rx0ps2451zW4

On Fri, 10 Nov 2023 13:20, "Daniel P. Berrangé" <berrange@redhat.com> wrote:
>Your approach to the problem:
>
>  if (!AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal)) {
>    exit(1);
>  }
>
>is adding dead-code because the exit(1) will never be reachable. So while
>it lets you squelch the unused result warning, it is verbose and misleading
>to anyone who sees it.
>
>Perhaps a more viable option is to pull in gnulib's ignore_value macro
>
>  #define ignore_value(x) \
>    (__extension__ ({ __typeof__ (x) __x = (x); (void) __x; }))
>
>and then we would have just this:
>
> ignore_value(AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal));

Good suggestion, thanks!

And to be fair, I did put a comment directly above that line to explain 
the unreachable code path. :)

+    /*
+     * We pass error_fatal so on error QEMU will exit(). But we check 
the
+     * return value to make the warn_unused_result compiler warning go 
away.
+     */

