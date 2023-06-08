Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp385965ejb;
        Thu, 8 Jun 2023 07:43:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Cg9TDxSUJEyhW3SLRcul7kyzDBhRZqTaB3AhCipxUjVAR3SSOh3wkxiKcVenzImMomoS/
X-Received: by 2002:a05:620a:6543:b0:75b:23a1:8e72 with SMTP id qc3-20020a05620a654300b0075b23a18e72mr4916736qkn.67.1686235393320;
        Thu, 08 Jun 2023 07:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235393; cv=none;
        d=google.com; s=arc-20160816;
        b=K0784NddssloM7MgeB3OiRrSzZ8m9cX0Ds2BgQQP3/IU9H2b4cF3+FXtppSbix9Kob
         dpH7IgEi6frbdlf4NtJThkh0aFs2h/Jb9IDDy0YTyRDSzG4czm/svdm6SzmRUK9R7tAo
         TZ+sTxdJSh2By2YWEu1+UJx6RN0bhdLS9VXVIiTDysu4wpUMf6MABbz1mNszxncUfLAz
         4XQ/D7fmnmUOL9nDnc6L7DkNVEc4NqHxcuS/2FA3tRJtEBHucbE7l/mD83JgKFcnTCx3
         AvNk4PGcCZ8PiUFKrHtp3SupUKHJdWn9U86oOnzCwdaaciif44lrsKq5bILeWJjbkcwE
         c6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4HODhGSMOoQB3YcLIahDn+iD2YU6SRVySIuGAxcv7UE=;
        b=sYz/QDtKtzX4tBYoI98rkmFhBxTrUQFzhPW34R4934dogzc96LHwnR9UMWyWMHoJ1z
         6PeBzpDIOzxe2bAyUnNDwmuohMLBtSp5/S+W7VZk96J6KgDdx1Za3cWaWnvEXsWn+2l+
         VVCM1pXqB6Lpa76yY/StmH2MWpasKv07emOWJdnrB6aYMVEsDyBuC8LlhcmfMoBK94tJ
         2axdMNdy187m2gVcTAzNzuwG2+yRwG3ytIT3uq2XXY/FlMG231rUrALLzpkGREypI5qr
         swmVz9JcfcCNnxbu8RY2BA72UFjFMth7CgXmaj939UjGAyAk1SfOhAFQvonQ9Y289tTn
         UszQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=huIL+bSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23-20020a05620a14b700b0075cc7d20d3bsi678687qkj.663.2023.06.08.07.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=huIL+bSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Gqq-000422-5M; Thu, 08 Jun 2023 10:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gqo-00040g-8B
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:42:58 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gqm-00081u-Tl
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:42:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51640b9ed95so1198329a12.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686235375; x=1688827375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HODhGSMOoQB3YcLIahDn+iD2YU6SRVySIuGAxcv7UE=;
 b=huIL+bSM9Bn5fYMpa//8GbDPSO/NhbtklzNpEQBz3q7WCyRK8Gc8iKVmRs18cYYrEJ
 tcBkpj8Q6P+M+VuaxMjtslhx5yIJpcpaVuN8TKcFdyy3lllg7mnfukJmHi+/5ICF0gxH
 xAdsfoLZG8hkTJu1wJrQwFu1flH8GOQ97GXRBQ0rjPhWZvrqLpZqyt25JnpP4muw6j07
 OU8y3Fhfdv4rOEwlve0O9oirXLJQkgCogcPHJ1N4mIA2mKnWl2eGn8jnMKAgBnrGFL7+
 tGgZ4iwB9mAdnVAiNyGqmKxhBSFhgkulUUf417j4gdvEYmxkPbGa/G4Q3c7jhb6Qt0xE
 Jmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235375; x=1688827375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HODhGSMOoQB3YcLIahDn+iD2YU6SRVySIuGAxcv7UE=;
 b=Rn3wgy4Xp9MGOf0JuAJ2jShwm1X6LL97NFK8IzSGK8j6vMUtmmEE6W5LXry+9g5XwI
 a2KrjVTdGVwBS24cr9M3mmMB4iTkEau4bwWlYXW10Hqg91VgL0eCGnDXE8yHIzS1MtZ5
 FnIIjmen568lDMy+f/rrjRtACuYId1WHKPgqKdfroYGrlBy08vvYMo5G0icFAVxLFP7H
 ttg1ahGLDW4FVqB/S5v+RsUnkQTka0Tujf68dRKS6oJUyZ3GQa0/bd/LAw7rzhAN+lk9
 pR6lYOZYROWS89lKV5Kkh3ypxYoIhPEI50bYNu8spFk5Wu3j+wApngC8IxXJg/Pl3iV9
 H0kQ==
X-Gm-Message-State: AC+VfDzURcEymNFckO0GhAVZYDAHNY5r/OKBPTVLRtOYEBFX/ZRT/9sK
 ZUqHioZYqHe4hWBc+WHR3CiHXJu2lU6iazJlEmRpkg==
X-Received: by 2002:a17:907:6e0b:b0:959:6fb2:1c3b with SMTP id
 sd11-20020a1709076e0b00b009596fb21c3bmr9180075ejc.39.1686235375299; Thu, 08
 Jun 2023 07:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-6-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:42:44 +0100
Message-ID: <CAFEAcA9_z941M2XejThLB-M++1u9PJZvO7DjXCsEOgOgHWn7BQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] hw/timer/arm_timer: CamelCase rename icp_pit_state
 -> IntegratorPitState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
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
X-TUID: VMMR9NQTrFLO

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Following docs/devel/style.rst guidelines, rename icp_pit_state
> using CamelCase as IntegratorPitState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

though PIT here is an acronym so I think style would prefer
IntegratorPITState ?

Either way
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
