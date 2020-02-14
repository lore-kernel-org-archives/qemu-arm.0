Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2278176lfp;
        Fri, 14 Feb 2020 11:13:33 -0800 (PST)
X-Received: by 2002:a2e:9218:: with SMTP id k24mr2915534ljg.262.1581707613314;
        Fri, 14 Feb 2020 11:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581707613; cv=none;
        d=google.com; s=arc-20160816;
        b=fwlUQ2QALc44CZb27ESZmehBIJueZJPUfwQnctVod/F58m3nzw+lfZSnI9WVgJUP97
         5S/r6JW+TB+8pupRrQv8opDuMn5+EQzyu7h9vChcpsi+5WDm/kCqe5O8LrUQjAKECCRA
         GvaH1jG6Dz/mBfAUx9BdeDIe9Q/hcTva53jEYGg5A8eaflUnjMM73AkHl+bbfxKCwAiX
         kMsAnI+cXUVN+TjTH4XK2iZwsW4G7tHOBLfaeV6t89itpGPPrK1zcZqR3j5oL89894sI
         QW55wOHFE/nbDasgBGj8SljrFWYiFlhoHly+lfVXErF+ytLigxvwZszeJ0f5S1lccG9F
         ZNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xe7l9a+UU84EZcyalv1Jkzz98U29uAV4gz6hIknjfsg=;
        b=O8qC14DHIz8XF0tiX+zcniHrm2IRE5B2i5wQKeryR7aiAFwDmNTDk1+1Zcbim4po6a
         w3RDfVBUZMGLQ6R/GMcQTfIwacfR7EezxwU/K7RsBCAFacVPpljFwBoPto3Jhi+Ms2g5
         t+KHWawgfZZuZMBosGXHSHUTnFoEiGsWK2iOq1wfoL0fJZDGLiEn9N9TflrymaK3d+cz
         oawLFATgfooU6oVzkSyd9Uj7AmKUay85RWqM7gkbrAOrZBH/OuG0++pEJq8cF4GLNbQN
         7IUhQXR0j4wPoPjIDo+RSczrmyqQMfUEW9O+QLPjsUDkLCsvXMi7IvIYB/ZqW0iYpg8W
         CSmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4eyh9JX;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i3sor5023476ljg.42.2020.02.14.11.13.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Feb 2020 11:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4eyh9JX;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xe7l9a+UU84EZcyalv1Jkzz98U29uAV4gz6hIknjfsg=;
        b=v4eyh9JXkUIVb1s55tjYJyrU2q/MUpTpLbK1Qx33h5UVBMNoP4aokX8M2IHU19lmhZ
         WvQVBvHkH/O/3a0xlB0eKGES4psQUAfYXE33BCSnyW7ZmaRwWupPEstqapzzMpmbL4BJ
         hmO8eYttEfADc+5dVTpH8VGsW5m1pC7Qb/ygw2I/MwBGOEoeijrfj7Ksv0VfCye5817j
         lnsw6JVxW31H3DQIvG5bylO2xIgAIfn1IKshtwas4sZzLDN0Oxn0STgJ27KtRANkmdrk
         BcwSXNIJrcHIFi5rTfN0CgamMS7L9V3qWaX14oa5GJQb0W4RKp1H8MBTMyafNGxaYwQJ
         fCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xe7l9a+UU84EZcyalv1Jkzz98U29uAV4gz6hIknjfsg=;
        b=sTBF93UgTT/r6ouQqdCGPihq7yOQ5QlpG9ueBoXbLt2udGeAxa+bOlsVh6N3OLaC9k
         1RLcUx39gYldMXLNOEmYzV6yjFWsS01VlN16klvwP1grNvoZ6LDA0T1IxF0rCza/Pd/C
         2VkrIxFjXhy0Z1cTSlL/u1MSqtKVurKsDu9lHgr9bYcq8X6cBQL4wUwFafA/1Cpj335m
         CHteCGgEvG4OTg7f99qURctrg76jQKUL/WDvqhWyRRtesJN2lHzy+3sqvfFhQ6njTkqA
         QLzEv0y2xsxc6qNWzWKGKX84tkzVnH2SS6GOTQI3a0/Lw2CQs7wfByKC0fDFS5Q/lucU
         YeCg==
X-Gm-Message-State: APjAAAU02z0SoHZeeZ9IknPXmJfJAOMm4MChYMkAryRopxRHl4amnhrg
	XI60LFMXDT7iykF4c2Uld67t7kVgOoE4YedZPlKSro0P+pM=
X-Google-Smtp-Source: APXvYqwb4dKnTvXtGoOt1kVP5GxbUkwbubU30HQPys92+k0iq48qoJFe/L7yvDjUrG2qc/QZvwMEFvkSqJmDhJ3DMUU=
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr3026406ljg.166.1581707612908;
 Fri, 14 Feb 2020 11:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20200213225109.13120-1-alex.bennee@linaro.org> <20200213225109.13120-20-alex.bennee@linaro.org>
In-Reply-To: <20200213225109.13120-20-alex.bennee@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Fri, 14 Feb 2020 14:12:57 -0500
Message-ID: <CAEyhzFtNowJc-f20QscmSzK+_1qVx59e2RYvuomY+oJOBFOasg@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] tests/tcg: take into account expected clashes pauth-4
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, aaron@os.amperecomputing.com, 
	Peter Puhov <peter.puhov@linaro.org>, kuhn.chenqun@huawei.com, robhenry@microsoft.com, 
	fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, 
	Richard Henderson <richard.henderson@linaro.org>, balrogg@gmail.com, aurelien@aurel32.net, 
	pbonzini@redhat.com, stefanha@redhat.com, stefanb@linux.vnet.ibm.com, 
	marcandre.lureau@redhat.com, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wTeVq1NLnIR5

On Thu, 13 Feb 2020 at 18:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Pointer authentication isn't perfect so measure the percentage of
> failed checks. As we want to vary the pointer that is authenticated we
> recurse down the stack.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Robert Foley <robert.foley@linaro.org>
