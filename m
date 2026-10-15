Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FE0CC6B3A
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 14:21:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHMKJ-0001W7-T7; Thu, 15 Oct 2026 10:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHMKG-0001Ui-Hr
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:20:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHMKE-00041S-2b
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792074051;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DD5iEbr+JLWkq6bQIgWITScf5DDXuPDK80oahfo5A0o=;
 b=Vetj8vD+AH3EakcsbheWvQvtev3YTSPHT4TZCsTvdbjqbEoFzl8n9o4h3js3XGTGTGN15R
 VhHCiQ/kQqbgRwIwcnxJjnUfAFhEj1lgC5fHPTJQ3g9SZYefzqvXOMaOlmcZb4JBLlLf8t
 Le4ZVsG/nicwJod8GaL4im6+o65F4+w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-3RzfYLnuNaWea9kbRJrJuw-1; Thu, 15 Oct 2026 14:20:49 +0000
X-MC-Unique: 3RzfYLnuNaWea9kbRJrJuw-1
X-Mimecast-MFC-AGG-ID: 3RzfYLnuNaWea9kbRJrJuw_1792074048
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4994d67d0e3so15139705e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 07:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792074048; x=1792678848;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DD5iEbr+JLWkq6bQIgWITScf5DDXuPDK80oahfo5A0o=;
 b=PkSwussyQuE9RDYXdEAd8lBfpD+wCWq1iddxEGskbCVVbeg6QklzDcCF8Wj8Sf3VIv
 Ne+H6DmfADZd34f4l7QoRJJdmaA6T8PwPpMNMyJM67PpmmUSvlE0b9yEQbkU0VWQy9hl
 SX1C/SaOJzQBSVhd9fHNdJ19C9dsCvTiYOlu7O5GZ3mr1u5n9spJc/xBrRbnZgrcky/o
 86IwINuqsVQ5OrsZc3tAA9g6OumPPzrAV40ehFYWd1CZMwYe7Q0UmrdxnqWZsvc3tKEj
 aW1Qe93frs3Vqnldo+gvlMcqBlRKr/v9LznPUGZU8Dm5nFsCkz73lKC/sCTHF8xQUbZB
 r3tw==
X-Forwarded-Encrypted: i=1;
 AKwUvByMExDnoMrLO5g1sjnE1qg5ng/aLz8mgKM3EE9L089HJGtbTOg1e/JZ3KI5HSYJD21FGD5n8shEgA==@nongnu.org
X-Gm-Message-State: AFq9FYLg1uyxvxO6olpToxaxvLAFDEhqWYt1NVNRW8BVvGTuWI1Lnwqf
 oG4UanChwLeURWr94gYOLFvXd+JG29xPjQs99bOfo8a3KK14K6Mfs1uXUsJooStKx3o/Jp+E6Ok
 8ECQOKLWqrqN53DEM1CiVnNZenFxVjtKva8nQWA9dXsMUmm1Z1oJvnQ==
X-Gm-Gg: AYBFou0KhyuaL534gxEKyDJ17DPjTnoG+St1xLxs/PTtasfnikT4am/8Uz/Fa1r8Pir
 5gtHwSPXNqhA9Lxk8oQ2cY/mauPyXErQm7K0IddTLfwqacI2I4xcV76CRg0yfDU6f2NhvXknbTi
 wnRVIUnsrZxtyyKwfYcDo6/qpCKpSDeIU5p7uJ64VR7Yw++Naz7m6DCGk6/FKr8wRZP/hFnlysz
 gK+OWhCZbS3GX5NwlsqAYt50GK/BuLIUlR38COZzJuinWpog9tTXavtnJgtVAAblBQHbCm0d2aw
 gFilk3IF4jDw8FewFSj1qy5tMCsasStCvQBQnEGj1DcCFUdwLK0whKFms8+ccAAzSSalI3AqegM
 /JAfTvDvBE0vDoX55XfRvJ9HRiP4/wjWDLDOpYVtULnCY1ZQl
X-Received: by 2002:a05:600c:a4b:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a1af68d397mr173679285e9.2.1792074048075; 
 Thu, 15 Oct 2026 07:20:48 -0700 (PDT)
X-Received: by 2002:a05:600c:a4b:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a1af68d397mr173678615e9.2.1792074047479; 
 Thu, 15 Oct 2026 07:20:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd97ed33sm85893405e9.5.2026.10.15.07.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 07:20:46 -0700 (PDT)
Message-ID: <543a8f0a-bd66-4c13-8117-07f069a754d8@redhat.com>
Date: Thu, 15 Oct 2026 16:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 23/25] qmp: add query-cpu-props-info command
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-24-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-24-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -RwQ8blBrLbzSHMFd2EnzLKUxSI3zAp8FvLYPVKB7rc_1792074048
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/21/26 2:32 PM, Khushit Shah wrote:
> Introduce the 'query-cpu-props-info' QMP command. For each CPU model
> property, it reports the type (boolean or number) and the set of values
> supported under the active accelerator and host.
>
> This helps the management stack to discover which values are supported
> for a given CPU property. This is especially important for non-boolean
> properties, where knowing that the host has value 'x' does not
> inherently reveal the full range of valid values supported on the host.
> For example, an Arm host with CTR_EL0.L1Ip=3 (PIPT) also allows 2
> (VIPT) but a host with CTR_EL0.L1Ip=2 does not allow CTR_EL0.L1Ip=3
> for a guest.
>
> For numerical properties, the supported values are expressed as a list
> of inclusive {min, max} ranges. For boolean properties, they are
> represented as a list of true/false values.
>
> The command and its return types (CpuPropertyType, CpuPropertyInfo and
> friends) are defined in qapi/machine.json rather than an Arm-specific
> schema, since the concept applies to other targets (e.g. x86, RISC-V)
> too. Targets that do not implement it return an error.
> (The following commit implements the command for Arm KVM.)
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  qapi/machine.json          | 82 ++++++++++++++++++++++++++++++++++++++
>  stubs/meson.build          |  1 +
>  stubs/qmp-cpu-props-info.c | 12 ++++++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  4 files changed, 96 insertions(+)
>  create mode 100644 stubs/qmp-cpu-props-info.c
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 2d63c1bac3..6e65bdad86 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -2291,3 +2291,85 @@
>  # Since: 1.2
>  ##
>  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'] }
> +
> +##
> +# @CpuPropertyType:
> +#
> +# The type of a CPU model property.
> +#
> +# @boolean: the property is of type boolean.
> +#
> +# @number: the property is of type unsigned integer.
> +#
> +# Since: 11.2
> +##
> +{ 'enum': 'CpuPropertyType',
> +  'data': [ 'boolean', 'number' ] }
why do we still need the boolean type? Can't we simplify and stick to
uint64_t for all SYSREG props?
> +
> +##
> +# @CpuPropertyValueRange:
> +#
> +# An inclusive range of numeric values supported for the property.
> +#
> +# @min: the lowest supported value.
> +#
> +# @max: the highest supported value.
> +#
> +# Since: 11.2
> +##
> +{ 'struct': 'CpuPropertyValueRange',
> +  'data': { 'min': 'uint64', 'max': 'uint64' } }
> +
> +##
> +# @CpuPropertyInfoBoolean:
> +#
> +# @supported-values: list of boolean values supported for the
> +#     property.
> +#
> +# Since: 11.2
> +##
> +{ 'struct': 'CpuPropertyInfoBoolean',
> +  'data': { 'supported-values': ['bool'] } }
why can't you model that with a range too?
> +
> +##
> +# @CpuPropertyInfoNumber:
> +#
> +# @supported-values: list of numeric value ranges supported
> +#     for the property.
> +#
> +# Since: 11.2
> +##
> +{ 'struct': 'CpuPropertyInfoNumber',
> +  'data': { 'supported-values': ['CpuPropertyValueRange'] } }
> +
> +##
> +# @CpuPropertyInfo:
> +#
> +# Information about a single CPU model property, including the values
> +# the host/accelerator supports for it.
> +#
> +# @name: the name of the property.
> +#
> +# @type: the type of the property, which selects the layout of
> +#     @supported-values.
> +#
> +# Since: 11.2
> +##
> +{ 'union': 'CpuPropertyInfo',
> +  'base': { 'name': 'str',
> +            'type': 'CpuPropertyType' },
> +  'discriminator': 'type',
> +  'data': { 'boolean': 'CpuPropertyInfoBoolean',
> +            'number': 'CpuPropertyInfoNumber' } }
> +
> +##
> +# @query-cpu-props-info:
> +#
> +# Return information about the CPU model properties.  For each
> +# property it reports the values supported under the active
> +# accelerator and host.
> +#
> +# Since: 11.2
> +##
> +{ 'command': 'query-cpu-props-info',
> +  'returns': ['CpuPropertyInfo'] }
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 3b2f2680b1..3bb4028bab 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -83,6 +83,7 @@ if have_system
>    stub_ss.add(files('qmp-i386-sgx.c'))
>    stub_ss.add(files('qmp-i386-xen.c'))
>    stub_ss.add(files('qmp-cpu.c'))
> +  stub_ss.add(files('qmp-cpu-props-info.c'))
>    stub_ss.add(files('qmp-cpu-s390x.c'))
>    stub_ss.add(files('qmp-cpu-s390x-kvm.c'))
>    stub_ss.add(files('hmp-cmd-info_mem.c'))
> diff --git a/stubs/qmp-cpu-props-info.c b/stubs/qmp-cpu-props-info.c
> new file mode 100644
> index 0000000000..36b0530b98
> --- /dev/null
> +++ b/stubs/qmp-cpu-props-info.c
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-machine.h"
> +
> +CpuPropertyInfoList *
> +qmp_query_cpu_props_info(Error **errp)
> +{
> +    error_setg(errp, "query-cpu-props-info not supported on this target");
> +    return NULL;
> +}
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 279a8f5614..2c25dbd8cb 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -100,6 +100,7 @@ static bool query_is_ignored(const char *cmd)
>          "add-fd",
>          /* Success depends on target arch: */
>          "query-cpu-definitions",  /* arm, i386, ppc, s390x */
> +        "query-cpu-props-info", /* arm + kvm */
>          "query-gic-capabilities", /* arm */
>          "query-s390x-cpu-polarization", /* s390x */
>          /* Success depends on target-specific build configuration: */
Thanks

Eric


