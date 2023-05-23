Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1893294ejb;
        Tue, 23 May 2023 06:53:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6l71jRF6Pt2I3n00ZDMA3I/EuWYHcwkA8uDRK9pV1DHAHwcfMd03rcw7hpj3Ns1dZoTj1N
X-Received: by 2002:ad4:5ce6:0:b0:621:404f:9c93 with SMTP id iv6-20020ad45ce6000000b00621404f9c93mr27568462qvb.40.1684850001012;
        Tue, 23 May 2023 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684850001; cv=none;
        d=google.com; s=arc-20160816;
        b=daELNyOrPy2Bb1luP6/0Y6w1rVXSqlWZepu2c+kkU/+TV+WnMEjbUA1HqPG3VCahQX
         c76hdL9XGc0apLL8VERfioJIBIeDglqHQ28dtKTC6T3+aB68YqRpLwD4Lx/p5NhnlI/u
         yFyRjTIG8s7ffu4YPiLmHxBAdin4yBFL/EOiv49w/TUxvFUnXDbALAqRXZe+OiuGWsOj
         XnbxTIYQwGt9kXo7yGz4PpOcqbhfeV5RNGsoswE/W+Rj1ADR1KcdWLEvIyODC5uPJnGH
         eQ6GYmbowPKwVBcECA+fmKA9YVLGzdari9dgThRH3EYKlB++6Bi1uZkh2biHDom3cNpx
         PYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=suCjM39hqwpZIWiSnBh466jG9Q2/j6oW3MExBX4JV+w=;
        b=JVXJxMxVXe+sZSR8/qs6ZVRf3qq9WPGGn+Vd/gM/qfYVAwlyvhBmeRMLGn5yNf8p1G
         PHMm+jGxOUt0TDmf9m4Ds04TZiSdBVHQ6jztqXK1oJoq7FdD1JRdeKaW/NT8qP8Ikw9X
         LVw/d4dbbS41PIblzUAWbuRtf+bfGCko4vsIaiQDVNwQEdtV7S7P/oQ5SfvyOEY5NJsL
         tX56kLQGEr+ZR0CjrdLj+1Pr9sXP/UA9dVrD0V37TWb5QD8Bz3o1KdZDFgeg+nywjA4V
         Ivjf1sQSBwZzL1Ziu+XBrrQPpPaodhixV2BsaI/yWxwst9a3DT7QlUAda/JnHAlWjYCj
         pXIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDCZ9tS7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020ac85e11000000b003d3b9f79b50si5061078qtx.467.2023.05.23.06.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 06:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDCZ9tS7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1SO1-0004NS-18; Tue, 23 May 2023 09:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SNu-0004Cw-Ql
 for qemu-arm@nongnu.org; Tue, 23 May 2023 09:49:10 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q1SNs-0001Tw-6j
 for qemu-arm@nongnu.org; Tue, 23 May 2023 09:49:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-510d92184faso1682322a12.1
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684849742; x=1687441742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suCjM39hqwpZIWiSnBh466jG9Q2/j6oW3MExBX4JV+w=;
 b=GDCZ9tS7dVTit9+hfPXoFnv13MXImtkHPLjtNKn8ztjyXuDVDhVzD6CUV9tmil10HN
 SvgLqZc/Zn6Jo+RSV2HaCci0zgoES/XgCuXDGRdUghCd19ncCrskRpjzR3hW6ADyG91c
 VbOZhwWZmBg8HEFEAfO3jUVx4bTK+kdsZ7lD8pWVs5JrimztVRRu1wy67kGVK3DSipEJ
 5rcAjH2c5dq137tvsRjOz76/Vt/uda1Xz3PGoVEtciD+CkqsHExo5wNAtKWQ4wywHWlq
 OeEUUiuPy9jyVGUjzUcaPVNaI8BG9IXo698owwGv7ktM3OJKq2UTRcBO20Km5Z1W7IeS
 WSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684849742; x=1687441742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=suCjM39hqwpZIWiSnBh466jG9Q2/j6oW3MExBX4JV+w=;
 b=UslMlHRk1jUejffPsIcWgqahaE5Pm8r/u+bLlsqinOyS9KozlEZmkDTStW1pNyOb1M
 hKwFri+2KHq56ZWlcYgOUNBGykPd9qwLqm5HY3o79MIAaYoZHOc0X/JJo9SpCLYMcTlW
 9W3r2jtKAl9KwrqwpSgQydbu5gBQhZJYG7hu/yXSc/GT0jhRZr8eMpxB5XwXvltvj1FY
 Bc3pxR27vjiArhfegV9T4gul/30gKB/FUje51O85JJfgxDMp0YAh8I2pNHCVe1WUPlE6
 OcWc65QQfAgDzTaJgLhz6ooK1lKMfyUxFKazVLvie7/IZaygiuxPuwli6TTPIwbOIYCR
 DzPw==
X-Gm-Message-State: AC+VfDxTR6fc2MDikDslS/CzS1qBKGg8eLWLUzpn9TYr43D60YXHeY8M
 CoEcThi9LesVjmeifudCZubRmrEL9nDwW2wIbohmnw==
X-Received: by 2002:aa7:d14d:0:b0:510:cda9:1eb7 with SMTP id
 r13-20020aa7d14d000000b00510cda91eb7mr11595209edo.21.1684849742061; Tue, 23
 May 2023 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230516203327.2051088-1-smostafa@google.com>
In-Reply-To: <20230516203327.2051088-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 May 2023 14:48:51 +0100
Message-ID: <CAFEAcA95KAM53cdZs46aZe8p0HuWm7g+25DryER8870f9NH55g@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Add stage-2 translation for SMMUv3
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OzzIPxIVi7vx

On Tue, 16 May 2023 at 21:33, Mostafa Saleh <smostafa@google.com> wrote:
>
> This patch series adds stage-2 translation support for SMMUv3. It is
> controlled by a new system property =E2=80=9Carm-smmuv3.stage=E2=80=9D.
> - When set to =E2=80=9C1=E2=80=9D: Stage-1 only would be advertised and s=
upported (default
> behaviour)
> - When set to =E2=80=9C2=E2=80=9D: Stage-2 only would be advertised and s=
upported.

Applied to target-arm.next, thanks.

-- PMM
