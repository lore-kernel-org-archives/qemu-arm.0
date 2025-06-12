Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2428912njc;
        Thu, 12 Jun 2025 08:29:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzie76GwgaC/NMODTzSqgIs4v4tzBf4tqO/963nPwF5vVsxmPhU+1xiIm4pKFvayMHUZz3LjsUNUGZpA==@linaro.org
X-Received: by 2002:a05:690c:6b09:b0:709:1b68:9f5c with SMTP id 00721157ae682-71161e51264mr5283247b3.16.1749742193859;
        Thu, 12 Jun 2025 08:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749742193; cv=none;
        d=google.com; s=arc-20240605;
        b=PCbYvgv5gIUd4rwjT/GLzor1+yExi4aF+c64Ln9IyAaA01Zx4n9gWyZQPNGYV8415G
         Nqa5F/EN/IFZ6gYAnyJuj4koB1EcH1Vtqq/Q+5CYYuvyniSf6TTNron4t2mCzvEPjCh3
         CP7R3gqRX5hLE1aLZmsc9uyz3wRcxtPWyJmebgpdvI4yKafnzDuWJXEoeSslT/cecBYO
         brNfoEi5LYC1cXmbqMxLLk2LJTmeeR2Wf0aill6sG1cmC/stgIZZ+N4bGLll4A2yOody
         hkEjkxW3Lo1VVsXTMRfhRCTNk7inLvFSFtJ0x1ART6XAcrh4U1zq0FefDpJJ/SjASQ1u
         /8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=geYJAPYMrYCt/FNmyMs6RoHZ9I62sqBam9PO+m4TAek=;
        fh=Sg5Fa98A1imksA6iBIUMzo08YysfCAUlYV2gM+ykXks=;
        b=KAQpjBbL7izdSPQekUqMIO7gkYgopQmwrc6UyQhBo4nHn0S97NuPJxAlNeGmgDduww
         NPu71xEkPOu+TVenh6NyCNooIRi3AZwN+PFkiCUqSK6MFPQ51whU3UElLEQIQDjNh7iV
         jhIlivw5MceTp7YSxeRtOLtYdMMxMzMB50KkknOWychIlXgWLWq3lPWktb1MjPL9mvXW
         cSj1vEAqZF4gphCp440NtyONmPoQWZao1v6vElriCD4sOrhhSetI7ge+8gtBOdJE9tUQ
         t7iyWzOEvXl4D0mp4pXoEat7Lxx8kZtxk52EIQZK9sMqSvGM87eucaECFCnXhnIB4mhR
         R4ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAVOLsWH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711515a9026sor12639837b3.5.2025.06.12.08.29.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 08:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dAVOLsWH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742193; x=1750346993; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=geYJAPYMrYCt/FNmyMs6RoHZ9I62sqBam9PO+m4TAek=;
        b=dAVOLsWHAAgV3oeJIkMqXFRv7WFGlw4bR+ejXz05nbbXQLvvcU1IkxkMKCRpAVpyGg
         cqpzwt8BkqYkm8hMvB7TWyeqWCC/gZOeYsOq6i51pdJLS4jEaFTCf+P0CF2MPxUxVWgr
         oj04tqQwSGs0kTkKLJiu6rjB0c77Sq3iR8Ywru23kQEexWoEzQa09STb19cjWyAysqb8
         gyGaFYMjQU5M55LiLoD83HH0ehFeZ+Fzd/QVxCqhqlq2xiAaiLHYqdazjscw6qMCwuLz
         lL4bpGPOTlh+EPn793y1dTNL7+1oFOX/QodgJJa5clVZsfivlno7KJEPKnWMLlx6ESge
         ofAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742193; x=1750346993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geYJAPYMrYCt/FNmyMs6RoHZ9I62sqBam9PO+m4TAek=;
        b=C/uZ52wdonIBopmVNO6GJ2CmpyUJ7h7fvZ4opHTvmCOW2Ko6ZSla1bFJ+l0PPqcidI
         OMa+kSyioLLj6s9ROa5Toi1iJqJEuWQ7nZqVeNoxHHDv8LCEPcC8TZi0ilKXJ507fZ5e
         z9r3WqJjQ4+qLONMXeJy/khSWr7amPkHklcdSGxt8q50YtY0ZZ6WpCFdVNAduFud06vQ
         YYbtYVtubtLSIurXVqbKsNFR3+GQd1JGXeyTg7aKx2t/ZgTLNXEQP6TcxUq7B24QU0z3
         2FaiS3y9i6iIR91GDn96rs9H0bpXlvYEyOkzI3bToQblQOop7LKV8WOirXhoNZ66BrRl
         jFnA==
X-Forwarded-Encrypted: i=1; AJvYcCUMBx4PeQgHgicheEn+P2woQBfc1RSH29cFc7lssmJQkwVqpODSJySsfkWlqYfqJo9pgkMoshvYEjzO8A==@linaro.org
X-Gm-Message-State: AOJu0Yxsi5vG2aQmb/tn0jKxBhPXz3/jxBu5Y1txP/OAU8NXVm3bVkCr
	1stlD44irTZTwzBOJ+hXHm2cY8jqIAiGoPn22ljj6UQkkBSaCJuhlRhCz1gFT5osswvQ8eNHSdT
	CIvX/B+9MYyoCrUfPoiN0BnjDCR5RBXPj8+llA5SCEiFU
X-Gm-Gg: ASbGnctbvIpsbcPTFoTHadYuIRO7eekV07/yTJafe7/VRlSEdVk6j4UGqbVAbJh3R7G
	m4XZ2Yo66vNSt+8r6pqLxWHHLsTGvJFaNRmX+uMs7sn3TFPmjQPmyVpesYdQWWDnN8dHj4MP1kH
	J2oJVmx0xmzCB4seh23sTOJmplKx0H/UXMHOPoMxQFmgm8
X-Google-Smtp-Source: AGHT+IENjmqyi7346POaDkGZR6RfoGXIVitfUyfSfUlXG98lTBAK4TulNP1eC5vKMUT/0qOqM92Y6Hx33E5GW3olJ4A=
X-Received: by 2002:a05:690c:7483:b0:70e:73ae:766c with SMTP id
 00721157ae682-71161effb98mr5173077b3.22.1749742193383; Thu, 12 Jun 2025
 08:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250515153907.151174-1-cohuck@redhat.com> <20250515153907.151174-13-cohuck@redhat.com>
In-Reply-To: <20250515153907.151174-13-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 16:29:41 +0100
X-Gm-Features: AX0GCFu9aivLSnaUx6RMU2aaTzhZKVbQDpI7U6eisLoQVjKLj6ZZzS6PLa-nZE4
Message-ID: <CAFEAcA-xDxoRLWZCMrAEeSb3NvyyOPzYgFQbbEzGALujOOG-3g@mail.gmail.com>
Subject: Re: [PATCH v7 12/14] arm/cpu: Add sysreg generation scripts
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: Tn9UPg9foErK

On Thu, 15 May 2025 at 16:40, Cornelia Huck <cohuck@redhat.com> wrote:
>
> From: Eric Auger <eric.auger@redhat.com>
>
> Introduce scripts that automate the generation of system register
> definitions from a given linux source tree arch/arm64/tools/sysreg.
>
> Invocation of
> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
> in scripts directory generates target/arm/cpu-sysregs.h.inc
> containing defines for all system registers.
>
> [CH: update to handle current kernel sysregs structure, and to emit
>      the re-worked register structures; cpu properties will be added
>      later]
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---

> diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysregs-header.awk
> new file mode 100755
> index 000000000000..452e51035d52
> --- /dev/null
> +++ b/scripts/gen-cpu-sysregs-header.awk

This should probably have 'arm' in the filename somewhere, unless
it's really architecture-agnostic, which I don't think it is.

> @@ -0,0 +1,35 @@
> +#!/bin/awk -f

Does this really need to be in awk? Our standard scripting
language is python. This isn't run at build time so there's
no "extra dependency" issue, but we currently use awk only
minimally and almost always for trivial stuff.

> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
> +#
> +# Usage: awk -f gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
> +
> +BEGIN {
> +    print ""
> +} END {
> +    print ""
> +}
> +
> +# skip blank lines and comment lines
> +/^$/ { next }
> +/^[\t ]*#/ { next }
> +
> +/^Sysreg\t/ || /^Sysreg /{
> +
> +       reg = $2
> +       op0 = $3
> +       op1 = $4
> +       crn = $5
> +       crm = $6
> +       op2 = $7
> +
> +       if (op0 == 3 && (op1>=0 && op1<=3) && crn==0 && (crm>=0 && crm<=7) && (op2>=0 && op2<=7)) {
> +           print "DEF("reg", "op0", "op1", "crn", "crm", "op2")"
> +       }
> +       next
> +}
> +
> +{
> +       /* skip all other lines */
> +       next
> +}

Generated source files should have a comment at the top
noting that they're autogenerated and how to regenerate
them, please.

> diff --git a/scripts/update-aarch64-sysreg-code.sh b/scripts/update-aarch64-sysreg-code.sh
> new file mode 100755
> index 000000000000..e34538887dd8
> --- /dev/null
> +++ b/scripts/update-aarch64-sysreg-code.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh -e
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Update target/arm/cpu-sysregs.h
> +# from a linux source tree (arch/arm64/tools/sysreg)
> +#
> +# Copyright Red Hat, Inc. 2024
> +#
> +# Authors:
> +#          Eric Auger <eric.auger@redhat.com>
> +#
> +
> +linux="$1"
> +output="$PWD"

We seem to set this but then not use it.

> +
> +if [ -z "$linux" ] || ! [ -d "$linux" ]; then
> +    cat << EOF
> +usage: update-aarch64-sysreg-code.sh LINUX_PATH
> +
> +LINUX_PATH      Linux kernel directory to obtain the headers from
> +EOF
> +    exit 1
> +fi
> +
> +awk -f gen-cpu-sysregs-header.awk \
> +    $linux/arch/arm64/tools/sysreg > ../target/arm/cpu-sysregs.h.inc

This looks like it is assuming that the user runs the script
from within the scripts/ directory ?

Following the same command line conventions as our existing
scripts/update-linux-headers.sh is probably the least
surprising thing.

thanks
-- PMM
