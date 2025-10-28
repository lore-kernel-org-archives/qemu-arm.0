Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24269CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 13:11:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDjTc-0002Im-AC; Tue, 28 Oct 2025 09:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDjTZ-0002IM-WA
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:11:02 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDjTP-0001Ql-4L
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:11:01 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-63b710f276fso5925366d50.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761657047; x=1762261847; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2O3ru6bTDJHgdmYgqB4W8Hotz207mC+7l7vbnYfbmNQ=;
 b=EiZlXOicts7pflPmN7DWc3K3iJCFyzX9+/vuapU833OUCtC3i6QqO21kWUf0c4/aRt
 lePyFzxXrSrRQyd8BUQh+HodA2XQYKBl4C7CyEUMtoc/K2MusouyFzZmGjiXgk2kzemJ
 Rno/Odgv7c/79NgRrHoFjXFcdNPMauwwcbEtJ5ZYdGQA7WuhLPLHx7O0q1gmzTM16kQY
 U63EYp8H9Beu2s9H1ifErBYORSQzw2N/yHACyPSlp3mLbzXve7ScZ+od+XIcCuZmPHZJ
 hu5hx5SSTYFjyFSouhzrSRVM0ZLSE5x+yZoX+gRXtcYTfAtBdquBozm3GKYQKGfF7uRU
 iCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761657047; x=1762261847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2O3ru6bTDJHgdmYgqB4W8Hotz207mC+7l7vbnYfbmNQ=;
 b=cM3bvSVQKYrShvqITe3sB6zvjhayoyhVNqL8FFSoPtuzDoEu3uPYVmW6/qhzXkoSXd
 wx38VSOk2xgaAAOai6ATcpOkQLE+yCt/TrSuGuulMyP1v7owkfcKsVjNwNRiTubZKUJl
 B8gb5NE8zHmAWU2V37xg+myuMo3ljBxTZdUVghfUUlyLwvRVZV/c+X/y1+/msnjrMFuZ
 0lY48dq7ksnaqRttyL5Z+3jvaqFMydXDXuzdrrGErIUfYsKk99fEfdjRDPfL4xys+TPD
 J5gd1CtRUPCO1GgS2I3tuj+BmYtHZsvxqj0TfksbdRic7f5axHMiMugytZFbEsK9YVk+
 31CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKe88sdk1BciM9Ho+3GOZp+j3yQQ0lFEEXPXiAtu388vh1VDYnK7kaOloGwDxI4iIIebEUf/xSoA==@nongnu.org
X-Gm-Message-State: AOJu0YyKMp0O2skr+mFjGEgnnbk/DB1qj4wLQX2v0pq7iT19XJ/NO7Uo
 68r6+LfWAsIKaq+eBHmPk4/U5Pg923NXFB7lK9Z4xbh+4DFkVm8iFytKQiMyDw6fV9Qc5XrSvy6
 c5MA6B0Ds9/fMuOK3NdOB3jfZSdmM27eXUcGtRAPXmA==
X-Gm-Gg: ASbGncvSB/LYpf8UmwJc/VIvIHYUw+nF+YIAi071FAX0IJDKzvWq7VyiOCF8IpHMgNG
 HxFKMI35UyN0mj2FVxJYkKsd8iBnNMhhz9ywT3DI3YBhVXUIiDJqnszNGGgTGD+6EkH6StzORI2
 mL2MO+O/me2q5+Q1W84d8pRk1pnOJm29elaLduJh2kOufftI7yEvPluWwys4XmyBcIjCdN75RKM
 bvS19DB6rSOT5g2jLZuqdks8fJ/mNpbTBdCoZcmey+3GLogKuuOpjstMbjL+w==
X-Google-Smtp-Source: AGHT+IGlHI9mLlBVkrO9VxmOtOe30pOmwlqni7AolhwbAyGX+QB02Qe1S2Xw+CDM724HOI8Ab6mLEN69LebUyKf/U3U=
X-Received: by 2002:a05:690e:1517:b0:63e:e5e:6b75 with SMTP id
 956f58d0204a3-63f6b94bc0emr3137514d50.19.1761657047361; Tue, 28 Oct 2025
 06:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251028054238.14949-1-philmd@linaro.org>
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 13:10:36 +0000
X-Gm-Features: AWmQ_bmI0UZUWFDDf5w0nAKk2QHOEmBqLLbhoAo-8KUaIShwBk8o89lZIsfU9ts
Message-ID: <CAFEAcA-3SzHPmLc-huMnyNbZBnEwi5+fbPNuvCYJcvY7gYboEA@mail.gmail.com>
Subject: Re: [PATCH v3 00/59] target/arm/hvf: Consolidate
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Oct 2025 at 05:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Missing review: 15, 18, 26, 32, 33, 38 (up to #41 could be merged)
>                 42, 43 (up to #49 could be merged)
>                 50+
>
> Since v2:
> - Improve host page size/mask uses (rth)
> - Remove cpu_test_interrupt in hvf_wfi (rth)

Richard found an issue with patch 32, so I'm going to
take patches 1-30 into target-arm.next (patch 31 is
reviewed, but conceptually part of the next few patches
in the set which use the new functions it defines).

thanks
-- PMM

