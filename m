Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp482221njb;
        Tue, 7 Jan 2025 14:37:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2jTlQmtCop1Pln3SiSi9P4PNM/mjKeqHk9mJKPHpQVSgClFbuCfAaEmPXGF23D5Yim3U65ykMof8mtw==@linaro.org
X-Google-Smtp-Source: AGHT+IEySB0qEzF93qqmhWoDxMftIIatC3RE22MjwWfJYGNkwK4es2OlNg8djBf+XqDLmBVI6IAr
X-Received: by 2002:ac8:59d3:0:b0:464:af64:a90b with SMTP id d75a77b69052e-46c7108fd17mr10601651cf.20.1736289461027;
        Tue, 07 Jan 2025 14:37:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736289461; cv=none;
        d=google.com; s=arc-20240605;
        b=chsKPr4OMqbVbKzRkfqGnHnV//CK5ecnATsk91rGE3FpqqOwcpwirSEGsDWLxN2Yo8
         Pa37YMnNLRjqqw7z5nZMhIsaVHVBnu11DXRiqzV/jxkqY+JgL0GPt9a/OnEYotjysKXK
         JLvRjhmK6p5E+QzuJmbDxMnC6GvaBHkbc8Qo9Su7C2EJ4fHeiGoe6/i9Et0a+LBlWOtl
         GTQbk6R651XQiT7tSwpQ1ROLsVzz86roC2tU+yq85reyziXU4LXkXYgv4SFaAsDNHBah
         gk1W9zZXSDorJbwfSafox42MPSprCzu8J3tXi8UN/wth7wrZzGmmEBIMERfDjPSXVjaM
         Skbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=N241ko3mBat1dQriBDWreCij5xSrjTHvxl/OHD03dxk=;
        fh=A56oimrdj6HkDWkQ77TFMOLM42Z0CCvayXZRJk/b0Cs=;
        b=Wpkf10GQIX1uRUZNr076FUCHJEcUJHFfq1RVzvqs9KZ95k8cK0PvITtz/l9drLpDDL
         ails8ydFTEfkDji8yLpDyKw4ktZK3HiFYxWT2sMB1PI7y91v0FTcp0fkGi0RLpoDd70/
         PSJ2z+ODRNJvWU8mjIcI9kuLGPmc77a+6Znr/yoequi1kJNZ4vDrojXv2ee/5w8FR1E2
         efafUf+sLrdcRa0vskgezbcwOxmGagOplS6svg9srD6CR/IljpC6X0ZQ2h1WbMqY5bnb
         iJmQl6WXlekbROhPjkYIXfMUvQqhh+EeFTcFbl/Aeh2oSCi6k22a+0RGbWF0BbfhEg/N
         k7fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h/zT7eNB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb99829si452283001cf.223.2025.01.07.14.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 14:37:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h/zT7eNB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVIBy-0007jf-GY; Tue, 07 Jan 2025 17:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tVIBx-0007jA-76
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 17:36:53 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tVIBv-0004G1-Ni
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 17:36:52 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e46c6547266so20676834276.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2025 14:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736289410; x=1736894210; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N241ko3mBat1dQriBDWreCij5xSrjTHvxl/OHD03dxk=;
 b=h/zT7eNBJxWhS08MNiH6B46olv+zuJnD1tJ1qQp4PIr0MFslahchfQoRsrbWeSUDL5
 D0lmCAK0c4YiQIN1BskV92wQtSyCsG4uyQIifhi9zoKZYKvjnHRUPcji/Xt+T1u27HfM
 U9nWrFewLUL4AEPNRKsIUIZrzizo59fT8ggremsNxMPHYic7DVLCU8qc023vNZlHtLnR
 mlwqwD6enhF0L+xqff4XYgfx8eaG+ux+iIySOgTmTC/ig5PhD35c0W5fiOaobuO6EkOf
 RrqrApq/AeRzqp6yQSTsQQmb/hDpwA/+SOtkwZqXWDK3ijIJd8br/93WAULX/B2Y21R5
 v7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736289410; x=1736894210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N241ko3mBat1dQriBDWreCij5xSrjTHvxl/OHD03dxk=;
 b=BKusI29d1PUYev9AlbY8Jyfv2/6Yd4chwihB7izcEJMUDviRYTvp9NQ2d+zu9OmQkf
 yga/4bl6vf3dONFs5n4re8PNIBhSzrXORRfl2FZ0fGXerxYpeafGB/Jxbz1iOGEb/ISV
 IXn2ZWcnvEgeZ8lX893wlFPjpBqRdIV8dao8AocGde/U5RyZqDg8sc1eSJ9A3LCbtOvU
 rwwBuYEtk6Ggn7/bO5g1SD54C8rRf7Hkk3IRG/5CG+DEqYwiJ121OfsJ1d7jwnhx+JF+
 izi6qwjedwkGQ9dkjBHCGcEaAg1uwXinr0BCgqzTqqoope3yCK+pGiqyqKfsNNofOVbv
 THqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpXAihFVoOAUNy7lR3WcDUhx/4SZI+8HXqUFfA3xRY02WPzGJWVfKaMvv0rfhhKz0b6vOkptEXHw==@nongnu.org
X-Gm-Message-State: AOJu0YzYaV4C8r2mILYIIHTnbN7enaMMEny5993bA1K8Y7wpjmD+6HaT
 Ba0MSr0sHKnP1AInJGUk/c+TBsQmwL7T25rY85gK/B/s8/XiFBmZ95mP3N3PEryhgcWsiSJHiMP
 6CdJCJDxGfVN7Ut+C/WyTtqzfs7jl7vR3fDX96w==
X-Gm-Gg: ASbGnctv0W9KhBvZcdfgF8Y9M8g3aHtuF5lmZ1RCRKPyIpgq6oZwIwFZsWSRh+w6RK+
 KIR6khgM/wrLkARFixsG3IFDSLQJi6xBosx8a+Bk=
X-Received: by 2002:a05:6902:1886:b0:e53:a95b:98d2 with SMTP id
 3f1490d57ef6-e54ee227f94mr579672276.44.1736289410548; Tue, 07 Jan 2025
 14:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
 <2e956389-289a-4806-8985-ab846d808736@kaod.org>
 <b520adf4-12f1-4261-a48f-bb74589bb31d@linaro.org>
 <a7c967ce-6bc0-47e0-aa25-cc89dab29cfb@kaod.org>
 <CAFEAcA9e5PFNoNh4u7paY5k5RnMgJ-3c++eGJd4u8CjjvDCvYw@mail.gmail.com>
 <53d67dbf-b595-4442-81e7-84267aa8e511@kaod.org>
In-Reply-To: <53d67dbf-b595-4442-81e7-84267aa8e511@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jan 2025 22:36:39 +0000
X-Gm-Features: AbW1kvao-OSrFjrvLlCeougddZRu-3ILtDjF3HoNrbR0Ri3vuvdD7Ywk5sY2Qgc
Message-ID: <CAFEAcA8Dz6b0fVjhEntNbbbb4UpBikUXsOmzU4WNabbrac+6Sg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce a new Write Protected pin inverted
 property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:SD (Secure Card)" <qemu-block@nongnu.org>, troy_lee@aspeedtech.com,
 yunlin.tang@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HkGJtN5Ik/qK

On Tue, 7 Jan 2025 at 17:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> > I would not recommend using qemu_irq_invert() in new code.
> >
> > I guess in an ideal world we'd implement a QOM object
> > that encapsulated the the "not gate" logic, similar to
> > TYPE_OR_IRQ. (Though for TYPE_OR_IRQ we made the mistake
> > of making it inherit from TYPE_DEVICE, not TYPE_SYSBUS_DEVICE,
> > so it doesn't get reset properly on system reset and so
> > the "what happens to the output on reset" is still not
> > really correct.)
>
> I see how this would work with TYPE_PL181 model but I don't
> understand how this could work with TYPE_SYSBUS_SDHCI since
> we don't have a gpio line to invert the level. Am I missing
> something ?

You have a gpio line, i.e. a qemu_irq, because you're passing
it to qemu_irq_invert(), and you could instead connect it into
a hypothetical TYPE_NOT_IRQ device. qemu_irq are GPIO lines,
the type just has an odd name for historical reasons.

-- PMM
