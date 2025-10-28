Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E404FCCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDiF3-0005mJ-R1; Tue, 28 Oct 2025 07:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDiF1-0005m8-Su
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:51:55 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDiEu-0007at-Mu
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:51:55 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so1390567766b.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761652305; x=1762257105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=if4SeftyPY4YOGFs06B2Ms4qhDTlHia+6cs4AEOESkg=;
 b=yrEJto473S7YTvAm3kIciIeuP7F3tZ/6EBwMIA2M5C31C2kw5h/coCNQ4fskwVkunh
 VYUoo9SqLR1Cw9JI6wmQ6IqgcBOftr0DCwvKIZTGJ6PToTj3vDzRUjAMZj402hUgrLD4
 1ressutk0/0xQL6DI5GuRowQpevvh0TrTTtlr5ouykHgUygo183uKpolcmzcgGegqxNk
 12C1Q5b48m7dsHtJKb9CMAbEQ/+vi6uWCIVSVOR03F0sUbxO4h6xUqJoeSxKBdFCRawy
 SoSVnmpUbDrrv57ju9fbeU3B+4kgMRKgIUgXbLb+lJ2eHw1tHzm9by+rXvabj1Yrf7mg
 Fh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761652305; x=1762257105;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=if4SeftyPY4YOGFs06B2Ms4qhDTlHia+6cs4AEOESkg=;
 b=QqAwX9o7rAcq1GmUrVRMoYN46PZDXvJnNndaELGuixLwwLMDfuX5JN1OcnaYE4MCEz
 XyLS3084F61sfLj27rfgOPr0/GRBUwC70pfnBEEk4lO/lOMQFr+MJ/4/C3TKNUxx++s4
 TB2tIh5+Z2yk9aDCUI1yJuKYl18gnY5+XG3WndWnriV/ILM3x5HXqEmBIHOs6n5mJEiY
 OK4apkjt1qRTQooYBrGMEZ+ZsqlUQ0Xj4VWKfMdpTxO+K34UEWAQIjhIY9t2MXi09I3E
 scqyzt/IwS16lWn2Fx4mUEvY6GbuYIBJa2qrqZPb63SLQ1BN88tQblA4B/U1gb3JgL0C
 mHtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXizH88ejsIOuff8XzuTjw7R95aPwzCxJ6wMiBpfPSa1jnSKP449pmEQtJyyo+dSBckNQHGO+EqKg==@nongnu.org
X-Gm-Message-State: AOJu0YzOBnwl12j8iuW+BI3WFJFgvBQrOhwOtAmh2AHnHd9q3T/9xYql
 t8dfqxwmSGnXJertwGt/yBdwqEHTpvrlFRsp7VgryOdNSzLhmcCTayCzKGeBruoTjNM=
X-Gm-Gg: ASbGncvnQqg2hD6hQN4Va4g5wCFWyIJPWPKYOgsVoH5bdP6w+d4XcLTIBLTz1C/bQBD
 CZIYX88l3sVw2vEGt8dOJIclH4fcuXUvZUBuqTKJBqSJPYgZ9WkE6jSXPBjDrAVvHey8JuKjSwd
 58O6I0mS4eT01nStaySevM3ixHmgmlGAmALbhbJlY9LLdGjzzGf1XlDA3GwVUHi3tn9yIuZZtqD
 ivK9M+fqrZFTb2fkSn2gZpn7dIsZ8JqjzY/AS7Oc8IZkY0JRCEWkzq76S0irwCY4J/vPkbjGOFi
 cBG2GKUvYsYNrzdhcuZhpZ3K1z70I9Ja4CGbbSKWgHUsMo8FJeQZLHHqupAzlFLNzMO9VqXbCcR
 sYGIcrQNbyoM9pWU5+GXqKb5yjsyG0HoBvrrvIW+JY9aBtC/FiUI8LRDKB3X5sFs10MAwhiBcJD
 Ob6UNejuIo7Og=
X-Google-Smtp-Source: AGHT+IGGFPuw9R4e2NpovDPbpMeSOBWQ5Acn6TGo+wd8txJFtLeyqYvll/fEP+mmi/hEAYE+Wn/+PA==
X-Received: by 2002:a17:907:847:b0:b07:c1df:875 with SMTP id
 a640c23a62f3a-b6dba58b628mr376462166b.56.1761652304813; 
 Tue, 28 Oct 2025 04:51:44 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85398444sm1063914666b.35.2025.10.28.04.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 04:51:43 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B43D75F828;
 Tue, 28 Oct 2025 11:51:42 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Mads Ynddal <mads@ynddal.dk>,  Cameron Esfahani
 <dirty@apple.com>,  qemu-arm@nongnu.org,  Roman Bolshakov
 <rbolshakov@ddn.com>,  Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,  Phil
 Dennis-Jordan <phil@philjordan.eu>,  Mohamed Mediouni
 <mohamed@unpredictable.fr>,  Peter Collingbourne <pcc@google.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 42/59] accel/hvf: Skip WFI if CPU has work to do
In-Reply-To: <20251028054238.14949-43-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 28 Oct 2025 06:42:18
 +0100")
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-43-philmd@linaro.org>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Tue, 28 Oct 2025 11:51:42 +0000
Message-ID: <878qgvxn01.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Avoid sleeping vCPU thread for any pending work, not just IRQs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

