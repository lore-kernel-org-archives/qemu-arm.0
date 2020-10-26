Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3096309lfa;
        Mon, 26 Oct 2020 11:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8nJXgwUwgko8zEjBSGOfwiZgNx87eO3tZw3SOePohJxHezvCmoQVlCX5Gp6NFZ3icy4SI
X-Received: by 2002:ac8:94e:: with SMTP id z14mr18379251qth.190.1603735754649;
        Mon, 26 Oct 2020 11:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603735754; cv=none;
        d=google.com; s=arc-20160816;
        b=TeXEBVaAY2dYi3wmqaxtKztpCZVjYwcIn0zLYqCjqmefFylpYN3DCc+e7kK4XyYSXI
         LiHWDZVpjTfUz64sHR0rlancQ6X4t3lgGflxwlNwEnUHv60RaTR/JXra9vUU+WnZUAkT
         2p56WAl2Sqj+VhjHAlJmyZelMuTJ+UAUg6URCtMH5Puqiucr5UFcg5ahaHcAdcTzq17R
         v0duSNG3h5x0dxPU1Skh9qQEXSETOz0FhVezsdfFqubiYnmfvp4ZGUImTEsyJGnRKlAF
         LDjoCrN/sLWjEpSroLDI83WoodgeFO1YhhyaoBjPStGGZlpwDKy8dRP8b4jjpf+aX6C2
         /ACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=55eyuk42pE0LCxXjckrKgBEEyBU4OQQsjW8M+YVDNtI=;
        b=Rl6+LoAHfFHuoNwWg3MA1KNvg+Tjglyi7QXcaIWMkpq4P8/BzLsYRppVQfaXkCrly6
         tGJssFqn4uy3xUF65HSbqHAvaik65B06hU0b3LmIUaqjgXJbKBLIPZOVmx49gcRCsiz0
         SpzHvSiRRbSFObKaemQ8lKgxdTTNVttecV+12MWfnRDp+kiBpv/NRHiNUIL1uf4U8D7/
         VuFyR6wB0zIAmLBgRTwTFHqnRZzFDuwiRte/cqy7DI7PSiFokI36LYsDf/E1j4j7RwMU
         ao/F/0g3Vr1/lmZ15AXyhqaDn5w6jGlORTzeKS2/IVPP7HcpWtyI8cD4HOJVdm8Cwla6
         Xwow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZgpWtk03;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si6853289qtm.202.2020.10.26.11.09.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 11:09:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZgpWtk03;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX6vg-00024S-7o
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 14:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX6MB-0000km-0g
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:32:31 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX6M9-0001yF-DN
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:32:30 -0400
Received: by mail-ed1-x535.google.com with SMTP id v19so10279743edx.9
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55eyuk42pE0LCxXjckrKgBEEyBU4OQQsjW8M+YVDNtI=;
 b=ZgpWtk03XcGWI3LJmox6frTtNbuBqsuKYDvvScWYFsMIbjb2Dt8aTCknk2EtPm7Med
 QlaITMsHAXAhGxdY5KRR0CB/9AyrAMnyg5WhuXlQcpfJ6g9WX8kfX19+5B/0HS3UOMO1
 zDh8jwCO2lvZH+68ph7qyNf827LeGrSftFP/qYM0/YT066DBWS9UpwFFrV573SXG5Vlp
 UzlTK4B1z4QU8pYfaNlOC1os8gyl2iwkXJI6MHB4knt1Y0LkKDCSXz3ArQyFo6AdNJvf
 hXqwoSCcAxEM+dszHSzrXfQb9dLggeMfNoxdJ2Nbw39dI7d2iSdVjBoRZx9sjtXHErsV
 k3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55eyuk42pE0LCxXjckrKgBEEyBU4OQQsjW8M+YVDNtI=;
 b=Rd9FodTK4ksRDu0I553oWvCy+3UiXYJNexyVkVh1ktSQapQh0tAu+077zLcZzwN+UF
 Ks1Mr4ghRmQmCs9wpPzTZN9g5gUAHTHQyeqjWQ/ptqSXbf8zodMM0xzwTZjA3/4nZ1hj
 qo3R1CN1XBZDWQMWWvDBOadv2lAO/moH3ITbF7GJOaEsmro9XfnJX9LOLhCkHnwhpZbR
 uNxwV39TGVQLijJPphR8nIsRtU5+R3UWAJO6iA1wR5m+FLmhsVRMHuJJ/RNocFTZHLMU
 8ldPIkvrROygE0yq5850rHEyuDPy4P+G74+hquZWG6rq1vZj0YgCvVC5JJgyexs5o4vi
 YU6g==
X-Gm-Message-State: AOAM532sGJKQKCWp8rmuAFgGT5vFD/ugLd402eEKrkWw2BpwIQY04NJW
 sCVNHH2AvEZ3gjPOsEYdrsL7pIW5puNDZtZRt/IXCA==
X-Received: by 2002:aa7:d699:: with SMTP id d25mr8936039edr.44.1603733547775; 
 Mon, 26 Oct 2020 10:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201026172219.GA5733@habkost.net>
In-Reply-To: <20201026172219.GA5733@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 17:32:16 +0000
Message-ID: <CAFEAcA96=ng8_SsVq0V3O8nvJkSFc+FZBATXmhok+hj1vOeELQ@mail.gmail.com>
Subject: Re: Dynamic instance properties in TYPE_ARM_CPU
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iwVV+NDuMPrU

On Mon, 26 Oct 2020 at 17:22, Eduardo Habkost <ehabkost@redhat.com> wrote:
> I've been trying to clean up the qdev property code (to bridge
> the gaps between qdev and QOM, and between QOM and QAPI), and
> I've noticed that TYPE_ARM_CPU is the only remaining user of
> qdev_property_add_static().
>
> qdev_property_add_static() has a misleading name: it won't
> register a static property.  It is actually a hack to use a
> static Property variable (defined using DEFINE_PROP*), but
> register it as a dynamic instance property.
>
> Dynamic instance properties make introspection hard.  What can we
> do to get rid of them in TYPE_ARM_CPU?

I'm in principle in favour of this because the Arm handling
of this is a bit odd and it would make sense to bring it
into line with how other parts of QEMU work. (Do other CPU
architectures just provide the properties on all CPUs?)

> Can we just register all the properties unconditionally, and
> error out on realize if the requested CPU configuration is
> incompatible with the available CPU features?

I think you would probably also need to check for and
adjust board/SoC code which assumes that presence of a
property implies that it's OK to set it, eg this in virt.c:

        if (object_property_find(cpuobj, "reset-cbar")) {
            object_property_set_int(cpuobj, "reset-cbar",
                                    vms->memmap[VIRT_CPUPERIPHS].base,
                                    &error_abort);
        }

or which uses presence-of-property as its check for
"does the CPU support this feature", eg this;
                /*
                 * The property exists only if MemTag is supported.
                 * If it is, we must allocate the ram to back that up.
                 */
                if (!object_property_find(cpuobj, "tag-memory")) {
                    error_report("MTE requested, but not supported "
                                 "by the guest CPU");
                    exit(1);
                }

> The following properties are registered as dynamic instance
> properties at arm_cpu_post_init():
> "cntfrq", "reset-cbar", "reset-hivecs", "rvbar", "has_el2",
> "has_el3", "cfgend", "vfp", "neon", "dsp", "has-mpu",
> "pmsav7-dregion", "secure-memory", "pmu", "idau", "init-svtor",
> "tag-memory", "secure-tag-memory".

thanks
-- PMM
