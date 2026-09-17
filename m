Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09E2C982D6
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:02:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7EXD-00033N-15; Thu, 17 Sep 2026 12:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x7EX7-00032H-Ue
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x7EX5-0005x8-7x
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789660818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9cjMDE/xoW1DN2a3AL/1sycq5b60UAl/O+tCmODO6A=;
 b=AT0pWugEmjtDV3Y3naVRi0LgYmI/DSNgCt11oMpny2LomfgV3ok/t44QDTdnludhqe1U2a
 0/cZ1cUIPu8MlgzJ0+wAIjGB6dgYDwPLTpfRUBcAStbPGveRRR7R1czQMs7Q5w09Kh4bP3
 MECFNjBufhgTbgKEMFbRghmlrbPnhLY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-_qR0tE_2MGG7MbRn6SMiXg-1; Thu, 17 Sep 2026 12:00:15 -0400
X-MC-Unique: _qR0tE_2MGG7MbRn6SMiXg-1
X-Mimecast-MFC-AGG-ID: _qR0tE_2MGG7MbRn6SMiXg_1789660815
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7a10c3de1baso806353137.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789660815; x=1790265615;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=u9cjMDE/xoW1DN2a3AL/1sycq5b60UAl/O+tCmODO6A=;
 b=Li3SN8V5o/7dUFUEemf4SLVprBlYW10m9WSOnGeJ3GJl9Os7CMbmfYQohPB3Hd5V71
 mIpOxlYly3x610icuce6tqT23OR6+dpLnALeNGxc1WnYpeBp0h9ekoKJvtlPtaUm+nWQ
 UCtfMYxINoyPg7LRPv0EQi6V6pymYaGxewCGQ+ImJp7QMLS+hvigdPtxKv1EWw7N01ar
 vDwFJv8zu0mt7qAi5gTi2dB80HHpR4aHAg4pJp4xPNIISQo+PIxJLvOnpDR9PGMl7SCG
 aZIFBwTk9sMa6Ep2I/1iKgxiyw0wnXNWu6s/BrVsplLF5plQwfKu9zvzdqsq3ns0Eb+m
 YUfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw3A4dU2Lg7Ffct//I65XZ4/IzE4MdZMx1VOEaRrvrqF9zmfvwJxxj4ybWk7iAlL1ByOUvhQdUuwQ==@nongnu.org
X-Gm-Message-State: AFuF++nTEAtQA5I2ldTH80CHlhnjZ3Jo+etERaOjgzZI6i2dkPs2iVeT
 I5FLtFhq+q+xnJyNNLyj0his2rwIv3CJHU9p4S0d9o8Vxes/405Xq+upCeyNJkpHWZWbTkYmz6z
 JvBwoSrSlcBCD6AIxSchR2z02ZafBX8nz3Hn5LFkKI0Shq+Oekl1q4A==
X-Gm-Gg: AYBFou28uA+EV0j/xN61LPs+r0YHnfRYQ6qijJHy1a7r3oor7Deexd7L/mhrcW1Wp0E
 Y6PZMNt69a6MNoDdj8gY4c056llN68Vn/QzcPfPjyXytWcCLKHDZnshv/gSirzavNwYWws3LjDp
 Lco7jofAx5tlg5ze9ttnxdKCTsxaH/3txo8BI8ib2ARnxOlMMnVvTPljZvTRwDfG0LhMyALl4BU
 ed/LMQqWd600C2XC4KAad94gcmlKGM8ij1OHcmM2pQQOvfHuC+FijREVtZOTqxpl1HU1WtTPW78
 CTfQTcS6kxbvb9MgZiUivLbiaknDFCN2n3/vLkExizCCX0yuHAL3wXJ5XUm94p+jeEYRMwJ0qMo
 5z3GM/7QtG3TckJJB1DpE3Kvf/yP+FyfDLSsnnfqDng==
X-Received: by 2002:a05:6102:41a4:b0:79e:b1cd:86f7 with SMTP id
 ada2fe7eead31-7a023d1966amr6221371137.1.1789660814616; 
 Thu, 17 Sep 2026 09:00:14 -0700 (PDT)
X-Received: by 2002:a05:6102:41a4:b0:79e:b1cd:86f7 with SMTP id
 ada2fe7eead31-7a023d1966amr6221338137.1.1789660814025; 
 Thu, 17 Sep 2026 09:00:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1292:d530:e939:7a09:c368:e5d5?
 ([2a01:e0a:1292:d530:e939:7a09:c368:e5d5])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c9a53ed5ebsm3040581e0c.12.2026.09.17.09.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 09:00:13 -0700 (PDT)
Message-ID: <2219b053-8321-4f51-8239-68a05bec6391@redhat.com>
Date: Thu, 17 Sep 2026 18:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] hw/vfio/pci: Bind a CXL device to its fixed
 memory window
To: mhonap@nvidia.com, alex@shazbot.org, ankita@nvidia.com, jic23@kernel.org, 
 dave.jiang@intel.com, alejandro.lucero-palau@amd.com, smadhavan@nvidia.com,
 pierrick.bouvier@oss.qualcomm.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, pbonzini@redhat.com, eric.auger@redhat.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org, cohuck@redhat.com,
 Nitesh Narayan Lal <nilal@redhat.com>
Cc: kjaju@nvidia.com, vsethi@nvidia.com, zhiw@nvidia.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, linux-cxl@vger.kernel.org
References: <20260916184412.3825713-1-mhonap@nvidia.com>
 <20260916184412.3825713-7-mhonap@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260916184412.3825713-7-mhonap@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xaxuBcxp5Fe03ddZp0352b0nFmTnVFRttSPesWia3dM_1789660815
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/16/26 20:44, mhonap@nvidia.com wrote:
> From: Manish Honap <mhonap@nvidia.com>
> 
> The guest programs a GPA inside a CXL fixed memory window and QEMU maps
> the HDM memory there, so the device must sit under exactly one
> single-target CFMWS. 

CFMWS (CXL Fixed Memory Window Structure). Pity that the fields are named
fmws_base,  fmws_size.

> Reject any ambiguous, interleaved, unsized, or
> missing window rather than guess. Match windows by target name, since the
> resolved target pointers are only filled in by a machine-done notifier
> that may run after this one.
> 
> Require exactly one endpoint function below the root port: two functions
> in the same slot would each match that single-target CFMWS and alias their
> HDM memory at one base, so count every present function rather than one per
> slot. The CFMWS windows are placed at machine-init-done, so a cold-plugged
> device can only be validated from that notifier, where a bad topology is
> fatal to startup. Validate a hotplugged device inline from realize instead,
> reporting through errp so a bad device_add fails cleanly rather than
> aborting the running VM, and arm the notifier only for a cold-plugged
> device.
> 
> The endpoint's HDM size comes from the kernel region. cxl_fmws_set_memmap()
> places the window in the guest PA map before this device is realized, so
> the window cannot yet be sized from the device; check the configured window
> against the device geometry instead. Reject a window too small to hold the
> endpoint and name the size to set, and warn on an oversized window, since
> the padding becomes guest CEDT that migration has to preserve.

I am lost ... Too much stuff there.

Each paragraph introduces a new topic/problem, and implementation details,
all mixed up, without first explaining what problem is being solved:

   A passed-through CXL Type-2 device needs to know where its memory
   window lives in the guest PA space so QEMU can map the device memory
   there.

Is that it ?

A maintainer reviewing this patch shouldn't need to know what a CFMWS
is to understand the commit. CXL is still an emerging technology.
Most VFIO and QEMU reviewers will not have CXL spec background and
CXL-specific mechanic knowledge.

> AI-used-for: code (prototype)

The code still reads like a proof-of-concept "prototype". This patch
in particular is very hard to follow. The problem isn't clearly described,
and likely isn't fully understood yet. The series should be broken into
smaller patches.

> Signed-off-by: Manish Honap <mhonap@nvidia.com>
> ---
>   hw/pci-bridge/pci_expander_bridge_stubs.c |   6 +
>   hw/vfio/pci.c                             | 192 ++++++++++++++++++++++
>   hw/vfio/pci.h                             |   3 +
>   3 files changed, 201 insertions(+)
> 
> diff --git a/hw/pci-bridge/pci_expander_bridge_stubs.c b/hw/pci-bridge/pci_expander_bridge_stubs.c
> index b35180311f..c44ad7fab6 100644
> --- a/hw/pci-bridge/pci_expander_bridge_stubs.c
> +++ b/hw/pci-bridge/pci_expander_bridge_stubs.c
> @@ -10,5 +10,11 @@
>   #include "hw/pci/pci_bus.h"
>   #include "hw/pci-bridge/pci_expander_bridge.h"
>   #include "hw/cxl/cxl.h"
> +#include "hw/cxl/cxl_component.h"
>   
>   void pxb_cxl_hook_up_registers(CXLState *state, PCIBus *bus, Error **errp) {};
> +
> +bool cxl_get_hb_passthrough(PCIHostState *hb)
> +{
> +    return false;
> +}
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 4716266595..670e0d1da4 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -27,7 +27,12 @@
>   #include "hw/pci/msi.h"
>   #include "hw/pci/msix.h"
>   #include "hw/pci/pci_bridge.h"
> +#include "hw/pci/pci_host.h"
> +#include "hw/pci/pcie_port.h"
>   #include "hw/cxl/cxl.h"
> +#include "hw/cxl/cxl_host.h"
> +#include "hw/cxl/cxl_component.h"
> +#include "system/system.h"
>   #include "hw/core/qdev-properties.h"
>   #include "hw/core/qdev-properties-system.h"
>   #include "hw/vfio/vfio-cpr.h"
> @@ -3641,6 +3646,171 @@ static bool vfio_cxl_check_topology(VFIOPCIDevice *vdev, Error **errp)
>       return true;
>   }
>   
> +/*
> + * Count the CXL fixed memory windows that target this device's pxb-cxl and
> + * report the matched window's base, size and target count. Match on the target
> + * names: cxl_fmws_link_targets() resolves target_hbs[] only at machine_done,
> + * which may run after this, so the resolved pointers can still be NULL here.
> + */
> +static int vfio_cxl_match_fmws(PXBCXLDev *pxb, hwaddr *base, uint64_t *size,
> +                               int *nwindows, int *ntargets)

I think this should be in the CXL subsystem. That's a *lot* of out
parameters ...

> +{
> +    GSList *list = cxl_fmws_get_all_sorted();
> +    GSList *iter;
> +    int matches = 0;
> +
> +    *nwindows = g_slist_length(list);
> +    *base = 0;
> +    *size = 0;
> +    *ntargets = 0;
> +
> +    for (iter = list; iter; iter = iter->next) {
> +        CXLFixedWindow *fw = CXL_FMW(iter->data);
> +        int i;
> +
> +        for (i = 0; i < fw->num_targets; i++) {
> +            bool ambiguous = false;
> +            Object *t = object_resolve_path_type(fw->targets[i],
> +                                                 TYPE_PXB_CXL_DEV, &ambiguous);
> +
> +            if (t && !ambiguous && PXB_CXL_DEV(t) == pxb) {
> +                *base = fw->base;
> +                *size = fw->size;
> +                *ntargets = fw->num_targets;
> +                matches++;
> +                break;
> +            }
> +        }
> +    }
> +    g_slist_free(list);
> +    return matches;
> +}
> +
> +/*
> + * Fix the bounds of the device's memory window once the topology has settled.
> + * Exactly one single-target CFMWS, with an assigned base and room for the HDM
> + * memory, is required; anything else is a misconfiguration the guest cannot
> + * recover from, so reject it rather than guess a window.
> + */
> +static bool vfio_cxl_do_bind_fmws(VFIOPCIDevice *vdev, Error **errp)
> +{

This does too much :

   topology validation
   CFMWS window matching
   size validation

It looks like vfio_cxl_check_topology() and it should be in the CXL subsystem.

> +    VFIOCXL *cxl = &vdev->cxl;
> +    const char *name = vdev->vbasedev.name;
> +    int nwindows = 0, ntargets = 0, matches;
> +    hwaddr base = 0;
> +    uint64_t size = 0, need;
> +    PXBCXLDev *pxb;
> +
> +    pxb = vfio_cxl_find_pxb(vdev, errp);
> +    if (!pxb) {
> +        return false;
> +    }
> +
> +    if (pcie_count_ds_ports(PCI_HOST_BRIDGE(pxb->cxl_host_bridge)->bus) != 1) {

This won't build on all platforms.

> +        error_setg(errp,
> +                   "vfio-cxl: %s: pxb-cxl not in HDM passthrough mode "
> +                   "(use a single cxl-rp)", name);
> +        return false;
> +    }
> +
> +    /*
> +     * Count every present function, not one per slot, and require exactly one
> +     * endpoint below the root port.
> +     */> +    {
> +        PCIBus *ep_bus = pci_get_bus(&vdev->parent_obj);
> +        int slot, fn, nendpoints = 0;

This smells like a function.

> +        for (slot = 0; slot < PCI_SLOT_MAX; slot++) {
> +            for (fn = 0; fn < PCI_FUNC_MAX; fn++) {
> +                if (ep_bus->devices[PCI_DEVFN(slot, fn)]) {
> +                    nendpoints++;
> +                }
> +            }
> +        }
> +        if (nendpoints != 1) {
> +            error_setg(errp,
> +                       "vfio-cxl: %s: %d devices below the cxl-rp; a passed "
> +                       "through CXL endpoint must be alone below its root port",
> +                       name, nendpoints);
> +            return false;
> +        }
> +    }
> +
> +    matches = vfio_cxl_match_fmws(pxb, &base, &size, &nwindows, &ntargets);
> +    if (matches == 1 && ntargets == 1) {
> +        if (!base) {
> +            error_setg(errp,
> +                       "vfio-cxl: %s: matched CFMWS has no base; reduce its "
> +                       "size or grow the guest PA space", name);
> +            return false;
> +        }
> +        /*
> +         * QEMU reads the endpoint's HDM size from the kernel region, so the
> +         * window size is really device information, not a value to make the
> +         * caller guess. Sizing the CFMWS from the device the way firmware does
> +         * is not possible here: the window is placed in the guest PA map by
> +         * cxl_fmws_set_memmap() before this device is realized, so its size is
> +         * fixed before dpa_size is known. Until a core change can size the
> +         * window from the device, take the device geometry as the source of
> +         * truth: reject a window too small to hold the endpoint, and warn when
> +         * it is larger than needed, since the padding becomes guest CEDT that
> +         * migration has to preserve.
> +         */
> +        need = ROUND_UP(cxl->dpa_size, 256 * MiB);
> +        if (size < need) {
> +            error_setg(errp,
> +                       "vfio-cxl: %s: CFMWS size 0x%" PRIx64 " cannot hold the "
> +                       "endpoint; set the cxl-fmw size to 0x%" PRIx64,
> +                       name, size, need);
> +            return false;
> +        }
> +        if (size > need) {
> +            warn_report("vfio-cxl: %s: CFMWS size 0x%" PRIx64 " exceeds the "
> +                        "endpoint's 0x%" PRIx64 "; set the cxl-fmw size to 0x%"
> +                        PRIx64 " to keep the guest memory map stable across "
> +                        "migration", name, size, cxl->dpa_size, need);
> +        }
> +        cxl->fmws_base = base;
> +        cxl->fmws_size = size;
> +        return true;
> +    }
> +
> +    if (matches == 1) {
> +        error_setg(errp,
> +                   "vfio-cxl: %s: its CFMWS interleaves %d targets; use a "
> +                   "single-target window", name, ntargets);
> +    } else if (matches > 1) {
> +        error_setg(errp,
> +                   "vfio-cxl: %s: pxb-cxl is targeted by %d CFMWS; use one",
> +                   name, matches);
> +    } else {
> +        error_setg(errp,
> +                   "vfio-cxl: %s: no CFMWS targets this device (%d present)",
> +                   name, nwindows);
> +    }
> +    return false;
> +}
> +
> +/*
> + * Cold-plug path: the CFMWS windows are placed at machine init done, so the

are you sure of that ? I think fw->base is already set when vfio_cxl_setup()
runs for cold-plug.

Normal vfio-pci has no hotplug-specific code, vfio_pci_realize() runs
the same path regardless of  DEVICE(vdev)->hotplugged. The CXL case
should be the same.

> + * binding can only be validated from this notifier. The VM has not run yet, so
> + * a configuration error is fatal to startup. A hotplugged device is validated
> + * in realize instead (see vfio_cxl_setup), where the failure fails device_add
> + * without taking down the running VM.
> + */
> +static void vfio_cxl_bind_fmws(Notifier *n, void *data)
> +{
> +    VFIOCXL *cxl = container_of(n, VFIOCXL, machine_done);
> +    VFIOPCIDevice *vdev = container_of(cxl, VFIOPCIDevice, cxl);
> +    Error *err = NULL;
> +
> +    if (!vfio_cxl_do_bind_fmws(vdev, &err)) {
> +        error_report_err(err);
> +        exit(1);
> +    }
> +}
> +
>   /*
>    * Learn the CXL geometry the kernel reports: the HPA-backed HDM memory region
>    * and the trapped HDM decoder block (which BAR carries it and at what offset).
> @@ -3717,6 +3887,22 @@ static bool vfio_cxl_setup(VFIOPCIDevice *vdev, Error **errp)
>                       "performance may be slow", vbasedev->name);
>       }
>   
> +    if (DEVICE(vdev)->hotplugged) {
> +        /*
> +         * The machine is already up, so the CFMWS windows are placed and the
> +         * binding can be validated now. Report a failure through errp so a bad
> +         * device_add fails cleanly instead of aborting the running VM.
> +         */
> +        if (!vfio_cxl_do_bind_fmws(vdev, errp)) {
> +            vfio_region_exit(&cxl->mem_region);
> +            vfio_region_finalize(&cxl->mem_region);

as said before, the tear down has 2 parts. Anyhow, I don't think we need a
CXL-specific hotplug patch.

C.



> +            return false;
> +        }
> +    } else {
> +        cxl->machine_done.notify = vfio_cxl_bind_fmws;
> +        qemu_add_machine_init_done_notifier(&cxl->machine_done);
> +    }
> +
>       cxl->enabled = true;
>   
>       return true;
> @@ -3729,6 +3915,12 @@ static void vfio_cxl_teardown(VFIOPCIDevice *vdev)
>       if (!cxl->enabled) {
>           return;
>       }
> +
> +    if (cxl->machine_done.notify) {
> +        qemu_remove_machine_init_done_notifier(&cxl->machine_done);
> +        cxl->machine_done.notify = NULL;
> +    }
> +
>       if (cxl->mem_region.mem) {
>           vfio_region_exit(&cxl->mem_region);
>           vfio_region_finalize(&cxl->mem_region);
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 06d15e807d..22fe8d7ff7 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -135,6 +135,9 @@ typedef struct VFIOCXL {
>       uint64_t hdm_offset;             /* block offset within the component BAR */
>       uint64_t dpa_size;               /* size of the HDM memory region */
>       VFIORegion mem_region;           /* HDM memory, mapped at committed GPA */
> +    Notifier machine_done;           /* CFMWS validated at machine_done */
> +    hwaddr fmws_base;                /* base of the memory window */
> +    uint64_t fmws_size;              /* size of the memory window */
>   } VFIOCXL;
>   
>   struct VFIOPCIDevice {


