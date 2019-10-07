Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a13sm38308974wrf.73.2019.10.07.01.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 01:35:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2B0A81FF87;
	Mon,  7 Oct 2019 09:35:35 +0100 (BST)
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-5-drjones@redhat.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, eric.auger@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v5 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
In-reply-to: <20191001125845.8793-5-drjones@redhat.com>
Date: Mon, 07 Oct 2019 09:35:35 +0100
Message-ID: <87d0f9j6lk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RDfiufzVF1ba


Andrew Jones <drjones@redhat.com> writes:

> Introduce cpu properties to give fine control over SVE vector lengths.
> We introduce a property for each valid length up to the current
> maximum supported, which is 2048-bits. The properties are named, e.g.
> sve128, sve256, sve384, sve512, ..., where the number is the number of
> bits. See the updates to docs/arm-cpu-features.rst for a description
> of the semantics and for example uses.
>
> Note, as sve-max-vq is still present and we'd like to be able to
> support qmp_query_cpu_model_expansion with guests launched with e.g.
> -cpu max,sve-max-vq=3D8 on their command lines, then we do allow
> sve-max-vq and sve<N> properties to be provided at the same time, but
> this is not recommended, and is why sve-max-vq is not mentioned in the
> document.  If sve-max-vq is provided then it enables all lengths smaller
> than and including the max and disables all lengths larger. It also has
> the side-effect that no larger lengths may be enabled and that the max
> itself cannot be disabled. Smaller non-power-of-two lengths may,
> however, be disabled, e.g. -cpu max,sve-max-vq=3D4,sve384=3Doff provides a
> guest the vector lengths 128, 256, and 512 bits.
>
> This patch has been co-authored with Richard Henderson, who reworked
> the target/arm/cpu64.c changes in order to push all the validation and
> auto-enabling/disabling steps into the finalizer, resulting in a nice
> LOC reduction.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  docs/arm-cpu-features.rst | 168 +++++++++++++++++++++++++++++++--
>  include/qemu/bitops.h     |   1 +
>  target/arm/cpu.c          |  19 ++++
>  target/arm/cpu.h          |  19 ++++
>  target/arm/cpu64.c        | 192 ++++++++++++++++++++++++++++++++++++-
>  target/arm/helper.c       |  10 +-
>  target/arm/monitor.c      |  12 +++
>  tests/arm-cpu-features.c  | 194 ++++++++++++++++++++++++++++++++++++++
>  8 files changed, 606 insertions(+), 9 deletions(-)
>
> diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> index c79dcffb5556..2ea4d6e90c02 100644
> --- a/docs/arm-cpu-features.rst
> +++ b/docs/arm-cpu-features.rst
> @@ -48,18 +48,31 @@ block in the script for usage) is used to issue the Q=
MP commands.
>        (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max"}
>        { "return": {
>          "model": { "name": "max", "props": {
> -        "pmu": true, "aarch64": true
> +        "sve1664": true, "pmu": true, "sve1792": true, "sve1920": true,
> +        "sve128": true, "aarch64": true, "sve1024": true, "sve": true,
> +        "sve640": true, "sve768": true, "sve1408": true, "sve256": true,
> +        "sve1152": true, "sve512": true, "sve384": true, "sve1536": true,
> +        "sve896": true, "sve1280": true, "sve2048": true

Does having a list of VL's not have implications for the versioning of
the API? Do we need to tick a version each time a new vector length is
added?

--
Alex Benn=C3=A9e
