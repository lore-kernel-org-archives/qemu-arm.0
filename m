Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1106926ejq;
        Fri, 10 Nov 2023 03:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWetxfN/Sr7wFy3wNmSHzM2zZzIWXyXemCVEtZ/n+4QtBNbxYqBll7IfIieETL11mbCrm8
X-Received: by 2002:a05:620a:25d3:b0:77b:bd56:1ac4 with SMTP id y19-20020a05620a25d300b0077bbd561ac4mr4348127qko.68.1699614150366;
        Fri, 10 Nov 2023 03:02:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699614150; cv=none;
        d=google.com; s=arc-20160816;
        b=dMVHNdfyWMBx2QH8dcbtH5RBsTQGhgfnFJb3rOZ7B/UK0slsM5tKHKE+EteIxVAP5C
         a38rsrkorzXuu4g048VXkIm5U8KHNHH1B0QDCqkEnkOCYKjnSFd+dfZZgJE73U04JYI/
         +T5UyPwFpdausyaURb//Sz1GcUjwiMsWSBb6Rd1vFaWsF6WL8Vvrl2jo+hTsAdqYwX4a
         QJvu4MyEs1iNr7OFFRIFvcpj4NZlplLl7/2y/pWwBeplvPC8mlQxiQrWKliZhO6mPM9E
         XzOxJdkG6haBzyIGnWBLr0s4kGIhOz2/hIjC1SRMgicPIoNw2/t6athNQWNESOD16Vmw
         uxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=cQlg1PFbziQhy1MSqYIFuEQXWN8xizhWbYBQqbezDhw=;
        fh=kp3Azl2K9Y/8KQsKot/1Jfa9DUXZwMGt9B8E3nvN2mk=;
        b=HOw67m/60F2QcN82dCxQlBTDprTaiAC3Z0gRSJKN+8VIFji17ygX7YycUeJhu1bjLp
         BOXTjLRdBtqBuAnqTZ9SiM19mqe4gPf5jAgbKczBek/6rOyH+zr1ZoYZwp90KkNCfaAR
         a33KaSDxN4ct6RvP5NehOJcNI4VcR3ppsdYo3H2K0Dr63PJf3ScwuFblba4GWq7ShR76
         IAVjzKDjb2fAODDduE5Xu8ESdHWVAEbGFCunNMkpsiBsgckkadGz+D5txJcbNzzEHwcy
         dVBnF7zcUKL7W2aXTcZ8e81lAGTGq6AxTlLZA9UBxeokN4jX+7kmLpYTS7hxCkZNb2zF
         NvvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eaxM+EXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl26-20020a05620a1a9a00b0077592c3366esi4339457qkb.329.2023.11.10.03.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 03:02:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eaxM+EXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1PHD-0005Lp-RD; Fri, 10 Nov 2023 06:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1PH8-0005LE-DE
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:02:11 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1PH6-0008Ea-9L
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 06:02:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4084e49a5e5so14567865e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 03:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699614125; x=1700218925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cQlg1PFbziQhy1MSqYIFuEQXWN8xizhWbYBQqbezDhw=;
 b=eaxM+EXOC9qxwt7GtuDQ/AJAm2BMdl0H204nmhU+f/ag9d8/Qkth3m0BDux+BJpUbg
 Ub9449ZTFK0O8ZsRkTMimQNO+nWRD+d8BE4AOxEd8rBrttYf026Ii2uHxEEA9bM54dOt
 QQxVtuFo57wjStlsaqXmxRC63c6Gxoyum1X46FzZ701xUAwKsDq6fHjwgWTS6WstWy8S
 9g44lICP4ES0AoF1R3dwD+77gysCUfQT8hHPPuhXZHyQVsKs+JxzGsHKCXvODhMGdL1k
 ObQ9EWHUt5Cvt5/5Dk3l6QQ3fPB+5zpdovSJTQdo0/Liyf1HovGwoCUjuFsVCbuAvBU7
 NO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699614125; x=1700218925;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cQlg1PFbziQhy1MSqYIFuEQXWN8xizhWbYBQqbezDhw=;
 b=uYsXs+VraUr7nMQrzcbWxkl2QoQKFdyIBzoN74D+EchmK5Nvs09tH7zhHqFOhpIwMs
 jZT18KKIVbV/61kcfUEm1pc0xvhtCJvEvHCHBfnV+6bzolxJjyMvmXHFdIlYqiWSmC7m
 MHowABV7f6U/TYiSEd1tELT2VzHtsm7HogrF6VOWJQgTqi2cgNPwd2sr5pjRgoCt4XSd
 KaLMi3GvK+C4omAA55oJD2O5Pt6Z551bu6fMGnsmLGulUHdkQ8bkXVs61SrdcjZrlquV
 PUAGv28N8fxC8b6a+vdMPcC38WP92dmEXQYrAoppmvwBAncQF3bPNEBN4NCBU/DpD8cD
 ZoDQ==
X-Gm-Message-State: AOJu0YyyMOFL4sLbEmgn31aK4RJQJdagVyrljVprBLOWJ1HLyzaRKIx+
 rZFTla0fQr7vDiU3tENBpMiy2A==
X-Received: by 2002:a05:600c:35d6:b0:402:8c7e:3fc4 with SMTP id
 r22-20020a05600c35d600b004028c7e3fc4mr6470094wmq.30.1699614125041; 
 Fri, 10 Nov 2023 03:02:05 -0800 (PST)
Received: from meli.delivery (adsl-157.109.242.225.tellas.gr.
 [109.242.225.157]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b0040a4835d2b2sm568664wmb.37.2023.11.10.03.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 03:02:04 -0800 (PST)
Date: Fri, 10 Nov 2023 12:44:56 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Marc-Andr=?UTF-8?B?w6kg?=Lureau" <marcandre.lureau@redhat.com>,
 <qemu-arm@nongnu.org>
Bcc: 
Subject: Re: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
User-Agent: meli 0.8.2
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
 <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
 <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
In-Reply-To: <CAFEAcA80sv6ewJ+LoROn-9ooEyLGQwiqYpL3=fqrK7gA0oZG-A@mail.gmail.com>
Message-ID: <3wmne.fhuf28sb5yfg@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: LQPH3qWSQWWE

On Fri, 10 Nov 2023 12:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>This kind of thing is why Coverity's unused-result warning has a
>lot of false positives. We shouldn't introduce extra code like
>this to work around the fact that the tooling doesn't understand
>our error-handling convention (i.e. error_fatal, and the way
>that some functions report errors both via the return value and
>also via the Error** argument).

I respect that :). But I personally believe that clinging to C's 
inadequacies, instead of preventing bugs statically just because it adds 
some lines of code, is misguided. Proper code should strive to make bugs 
impossible in the first place. At least that is my perspective and I 
would like there to be constructive discussions about different 
approaches in the mailing list. Perhaps something good might come out of 
it!
