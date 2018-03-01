Received: by 10.28.91.67 with SMTP id p64csp2031954wmb;
        Thu, 1 Mar 2018 08:32:54 -0800 (PST)
X-Google-Smtp-Source: AG47ELsWUA6QFJ8qcnOgVQlpcHMFTZDUwdhR3Vs9jQdIflTAuugvf+ESm/oclA8/RAWUJOc7ezs3
X-Received: by 2002:a25:32c1:: with SMTP id y184-v6mr1248311yby.174.1519921974847;
        Thu, 01 Mar 2018 08:32:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519921974; cv=none;
        d=google.com; s=arc-20160816;
        b=ImxP6O2sXg9RxCA1lc+Y6N0996ld9vwF48G0qjFk8t5JdZhuM7qXFXchHri5tW/bCZ
         0XUPMK4pg+b9dpWIcztoH7Wlmfz1zG2Mz08SD1mjzNIMxRwCf5Zu/nv5fUomKra4Hzrf
         GAC/e/hhvC4hzkrvEyE8BMIalVrfeRHz926rekTzv/023yiw7sKeaJxA8nKLJ7KI92Z8
         i50yoICkwMhijJwNzyV9jagXUcMUYOGwQ1Z+VgyqFY9OhL0I9eLz3y/NLC8WCbZAk562
         VevrEKN6lIXGun+2A8HwTqR71aq+zLbpCpCEnZ6oaM2tSCPVLQnOydPtDqwF972mlShb
         62Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=M1OUW381ZBWKUfKO3maMzbsv5GzUy+pJ9oEMyYLW6ZQ=;
        b=TUOhM/bCnljwWmqYBysWHhBn7FnRnZww+ZE0NG6W3gPlg/tpGbVuYQVwUZUSyIkavL
         snBvdTNJj671d6V+0u877sYMgcMtsFcSeW4ZeFI06qeyup/uxM4ZAqayd8pOHuxpnx0L
         x5l77WuRrHa0R+17mrVpy2VUeOEH6KoDBDSZJn0qpUVCqw6JZmDtxPOBSZyBaFcM7IfL
         /SzvXL93wWe29LeO10Cp5mLuZVJCBCjs7/Yqcbv+Qz19wDQsIbvTNlm3MfLHb4twOIUR
         cYuP3NwGApTV3d6SiqjYIs1XafBYzt4/Jud614b+syGR6NDT45YRCmv2q8rHHhEovxbk
         B/0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hoD2/Owb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o20si717369ywm.559.2018.03.01.08.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 08:32:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hoD2/Owb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erR8Y-0002rr-5W
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 11:32:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erR64-0001Xq-Lx
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:30:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erR61-0005hH-UF
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:30:20 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:41223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erR61-0005fD-0j
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:30:17 -0500
Received: by mail-oi0-x244.google.com with SMTP id g5so4900919oiy.8
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M1OUW381ZBWKUfKO3maMzbsv5GzUy+pJ9oEMyYLW6ZQ=;
	b=hoD2/OwbX4VUhH15EKJSomZvfdHKGnS5K5OBuvkoLjJeTkP2PyFLLbOdp+pxFYz8HM
	1gmwJ5eqNRm6xG6pWYhqZSIRN5e8ViB/TTdXJAQcnDmwJ9bkdJcdpkowOnj9Z7Z2kUw2
	HI8ZbWoN8ZzpCxYeRrot5+OpNR44DcrbICaww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M1OUW381ZBWKUfKO3maMzbsv5GzUy+pJ9oEMyYLW6ZQ=;
	b=Ogko9PoX6EJYQuAk8mHD9FEkJtqXc2m/95sVeJ2emfNDHxayJy/06Pfv5xa4gf+FiQ
	oL3y107nABImO2GQV23wULJo7BO6jYDAn8Aa5Jcuk0JObNjoqY92yFFOHZ6rcFPCgUOf
	+UDt7JYxffNXgqN0XxIQe7zavfpQINl7+p3UE/ONJqShYFkYiMPvKL7KSbRvp4naIrR9
	yJ2Cc4QlBOgclxBdktUiP1xQiFjAPMs+V6BQgqdaWwNjn+0kEVp3FmP421Ts8vaUgQCp
	b+zCAM/+nVDIlAe1OiCKU6TiZ3QkvuguGPJoOffJYxXTqHrPS1hh5swLOIXjL5LBXM0r
	YVBA==
X-Gm-Message-State: AElRT7Ho7/gFN35C2fT0i9L0hz5gNVPxod4iRulDFA6XJZrd181EjgKy
	Nsvs2VtjS5J1u2OLSwBvqEOEISjoW70zoCDIlVMmtg==
X-Received: by 10.202.17.13 with SMTP id 13mr1533544oir.164.1519921816211;
	Thu, 01 Mar 2018 08:30:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 08:29:55 -0800 (PST)
In-Reply-To: <1519815685-29200-3-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1519815685-29200-3-git-send-email-abdallah.bouassida@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 16:29:55 +0000
Message-ID: <CAFEAcA8hSz-WUsAo2J3VJWSQTg4_ueX8RgAhAG15wvjBeRf4tQ@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH v3 2/4] target/arm: Add "_S" suffix to the
 secure version of a sysreg
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cisJl2OuhE2T

On 28 February 2018 at 11:01, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> This is a preparation for the coming feature of creating dynamically an XML
> description for the ARM sysregs.
> Add "_S" suffix to the secure version of sysregs that have both S and NS views
> Replace (S) and (NS) by _S and _NS for the register that are manually defined,
> so all the registers follow the same convention.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
>  target/arm/helper.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bdd212f..1594ec45 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -694,12 +694,12 @@ static const ARMCPRegInfo cp_reginfo[] = {
>       * the secure register to be properly reset and migrated. There is also no
>       * v8 EL1 version of the register so the non-secure instance stands alone.
>       */
> -    { .name = "FCSEIDR(NS)",
> +    { .name = "FCSEIDR_NS",

I think this should just be "FCSEIDR", because the convention we
seem to be going with is "_S" for the secure banked register, and
no suffix for the non-secure banked register.

> @@ -5562,7 +5562,8 @@ CpuDefinitionInfoList *arch_query_cpu_definitions(Error **errp)
>
>  static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
>                                     void *opaque, int state, int secstate,
> -                                   int crm, int opc1, int opc2)
> +                                   int crm, int opc1, int opc2,
> +                                   const char *name)
>  {
>      /* Private utility function for define_one_arm_cp_reg_with_opaque():
>       * add a single reginfo struct to the hash table.
> @@ -5572,6 +5573,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
>      int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
>      int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
>
> +    r2->name = name;
>      /* Reset the secure state to the specific incoming state.  This is
>       * necessary as the register may have been defined with both states.
>       */
> @@ -5803,19 +5805,26 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
>                          /* Under AArch32 CP registers can be common
>                           * (same for secure and non-secure world) or banked.
>                           */
> +                        const char *name;
> +                        GString *s;
> +
>                          switch (r->secure) {
>                          case ARM_CP_SECSTATE_S:
>                          case ARM_CP_SECSTATE_NS:
>                              add_cpreg_to_hashtable(cpu, r, opaque, state,
> -                                                   r->secure, crm, opc1, opc2);
> +                                                   r->secure, crm, opc1, opc2,
> +                                                   r->name);
>                              break;
>                          default:
> +                            s = g_string_new(r->name);
> +                            g_string_append_printf(s, "_S");
> +                            name = g_string_free(s, false);

You can do this more simply with just
     name = g_strdup_printf("%s_S", r->name);

You only need to use the g_string APIs when you're appending to the
same string multiple times; if you're creating the entire string in
one go this is simpler.

>                              add_cpreg_to_hashtable(cpu, r, opaque, state,
>                                                     ARM_CP_SECSTATE_S,
> -                                                   crm, opc1, opc2);
> +                                                   crm, opc1, opc2, name);
>                              add_cpreg_to_hashtable(cpu, r, opaque, state,
>                                                     ARM_CP_SECSTATE_NS,
> -                                                   crm, opc1, opc2);
> +                                                   crm, opc1, opc2, r->name);
>                              break;
>                          }
>                      } else {

This means we're going to have the hashtable entries be a mix of
structs that point to constant strings and structs that point to
dynamically allocated strings. That's OK right now, because you
can't dynamically construct and delete Arm CPU objects. But if/when
we add support for that (eg for cpu hotplug) it'll mean memory leaks.
I think the simplest approach is that:
 * in add_cpreg_to_hashtable() instead of r2->name = name we should
   r2->name = g_strdup(name);
 * the code here which allocates memory for the _S variant name
   should then do a g_free(name) once it's called add_cpreg_to_hashtable()

Then disposal of hashtable entries (when we write it) will be simple:
always free r->name.

thanks
-- PMM
