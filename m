Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2944855lfg;
        Mon, 3 May 2021 12:41:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKUeYMYLIKVLCpY+vfaBUI5b0sMxvKuT3fhTmRpcMvGFpe/Vx99WHVXDS3QlHUznVEQz1a
X-Received: by 2002:a05:6e02:1c01:: with SMTP id l1mr18102223ilh.25.1620070892537;
        Mon, 03 May 2021 12:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620070892; cv=none;
        d=google.com; s=arc-20160816;
        b=Xs6/3PF3YFBRzgv5xgRPB+WgoCCqZ0NjzjKIb45DL7H8LaRLkMoYzOhgfcLgF8bV9p
         j2jZCKup6yYApLxSgNH8pVlEGlPhx5jPmoQaCvQGHrokxny1IdsEDBc1jrUoPAiA5O4+
         CNmJlGsvF4zqVVYXxJkTJfFBG5rXvH9DNgsu4EW6tZOUjTVOWObpfs3hc60QTrwAI/56
         Y9z8jmuqVnBgrZcDtoa7YL34l5H3iZDygsej4UCW58+9Rp1MJrky6gcpzhu4+wsN1yJE
         dEijcSsNDAx4IYI8Ij8lLnRCFMj4roU7xY6iW3JS3AD3cLfP2Xj078xfDskS6TtLpeuI
         K1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=49uMkI2LDJUBbo1RdUn6p3ogziBXNQ+k2mStqHbBt6c=;
        b=nnGcNYY3Jxdm/8cOw8SGb2jJCbPSsk63c+vmD2chvW+iJUxLcn79sROPGVU21r7LFr
         0j6bBkiS+7cGyfpF+FYHEuHBZ61+BUH4EOD5vdtrZYGNmqUMKhOylCTsxl1Lk1GeLgDB
         2z8kViq87ZSFWTd4UKF7YpmNDg3QIvxsoBWPlg6+MvUdFj3LHv8c1NwFJUpX3vOmHqii
         MSnYEo+lfNBcsteBO9YB9IfG0Ax0GrbZ+1Qc4mYolgVbRG8ydNBsi8OWlEjFihNUgsGN
         0dN/n8W0jrP8Lz9+1IQs/kZGaDwg2XBCrtu1prhxYsl5uZdSBlTXripjng5Gqup5YSfm
         yW3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@intel-com.20150623.gappssmtp.com header.s=20150623 header.b=Xdo9o1iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26si8105193jao.108.2021.05.03.12.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 12:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@intel-com.20150623.gappssmtp.com header.s=20150623 header.b=Xdo9o1iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldeRf-0002Zc-PV
	for alex.bennee@linaro.org; Mon, 03 May 2021 15:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1ldeRO-0002ZB-8a
 for qemu-arm@nongnu.org; Mon, 03 May 2021 15:41:15 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1ldeRJ-0003HY-TV
 for qemu-arm@nongnu.org; Mon, 03 May 2021 15:41:13 -0400
Received: by mail-ej1-x631.google.com with SMTP id u21so9590875ejo.13
 for <qemu-arm@nongnu.org>; Mon, 03 May 2021 12:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49uMkI2LDJUBbo1RdUn6p3ogziBXNQ+k2mStqHbBt6c=;
 b=Xdo9o1iNXHMcXoN0NEfgUJc2TJ63sNUEPD69vu78K8ePizsDNpXPDhc982m1EM/7rw
 VVW7AeI+SANwHAGZA7LhdV7HmDawhlE4kL0jDTIJQSn6gEQQrHHtf6FQgOaBM5qkXVrT
 yQq0VNtX6b8/syduyyLabAKypJu0VKU+yESPO0hfgRkVw/Weddxa/L5eHKOQdU2aj3VZ
 BNtNV7rt0LQZxw/GqrUiwvYuhP70ijFXkLiVNoPZ1HU0cI1ehmSvhBNn/ZjxiHP+AirF
 gLAs81224BQKYH0PyPjVB7MIjBqIAenvdmOBmXIEnUqx8ARYXVDMt4zfpC1qIw1M0f4h
 4yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49uMkI2LDJUBbo1RdUn6p3ogziBXNQ+k2mStqHbBt6c=;
 b=ub0gOV9O66bCln/yD45xilbv50qgGhAq7u8sKZwl+6Q09qNqvCiLTwPuzaiBEEVwRR
 Uu785hd5EqfR4CdXUjMIfvg/iWCqbkBW+BCkmeZTHK7ZiyQ1J+Iz6/k9S7avkHcizIIo
 bq+O8c/Y7U2kzUW9+xNOze1yF1zdltIkrGvFTpWqpuRocmNzNLXhpJXNhT3fzRZM9lJ0
 lMz+1Qr1Rhw78V97b/EDpZuLRE4aRs0SUY0T0+sJKpCvU+QPgqWvqI0PfaqOIEE4Rucq
 lwJn8v0ToQNvKuEeMOfRZ6hqnaxYEPTtyJFriQXCajNQMZLbA1mZgH8tI5C4NY9jXVn/
 OUMA==
X-Gm-Message-State: AOAM531tlKOik/w9dPSsNcHLyfsWdXYNEaNKu+/i28XhddXYA12h9ciY
 g8nVIc/PnLTQNSmVRLByfk4tyXqM6jRiQWBaaT2OkQ==
X-Received: by 2002:a17:907:1183:: with SMTP id
 uz3mr18129036ejb.264.1620070865840; 
 Mon, 03 May 2021 12:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
 <bca3512d-5437-e8e6-68ae-0c9b887115f9@linux.ibm.com>
In-Reply-To: <bca3512d-5437-e8e6-68ae-0c9b887115f9@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 3 May 2021 12:41:08 -0700
Message-ID: <CAPcyv4hAOC89JOXr-ZCps=n8gEKD5W0jmGU1Enfo8ECVMf3veQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=dan.j.williams@intel.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, marcel.apfelbaum@gmail.com,
 bharata@linux.vnet.ibm.com, Haozhong Zhang <haozhong.zhang@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kwangwoo.lee@sk.com, David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a6hSuK1wLg5n

On Mon, May 3, 2021 at 7:06 AM Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:
>
>
> On 5/1/21 12:44 AM, Dan Williams wrote:
> > Some corrections to terminology confusion below...
> >
> >
> > On Wed, Apr 28, 2021 at 8:49 PM Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:
> >> The nvdimm devices are expected to ensure write persistence during power
> >> failure kind of scenarios.
> > No, QEMU is not expected to make that guarantee. QEMU is free to lie
> > to the guest about the persistence guarantees of the guest PMEM
> > ranges. It's more accurate to say that QEMU nvdimm devices can emulate
> > persistent memory and optionally pass through host power-fail
> > persistence guarantees to the guest. The power-fail persistence domain
> > can be one of "cpu_cache", or "memory_controller" if the persistent
> > memory region is "synchronous". If the persistent range is not
> > synchronous, it really isn't "persistent memory"; it's memory mapped
> > storage that needs I/O commands to flush.
>
> Since this is virtual nvdimm(v-nvdimm) backed by a file, and the data is
> completely
>
> in the host pagecache, and we need a way to ensure that host pagecaches
>
> are flushed to the backend. This analogous to the WPQ flush being offloaded
>
> to the hypervisor.

No, it isn't analogous. WPQ flush is an optional mechanism to force
data to a higher durability domain. The flush in this interface is
mandatory. It's a different class of device.

The proposal that "sync-dax=unsafe" for non-PPC architectures, is a
fundamental misrepresentation of how this is supposed to work. Rather
than make "sync-dax" a first class citizen of the device-description
interface I'm proposing that you make this a separate device-type.
This also solves the problem that "sync-dax" with an implicit
architecture backend assumption is not precise, but a new "non-nvdimm"
device type would make it explicit what the host is advertising to the
guest.

>
>
> Ref: https://github.com/dgibson/qemu/blob/main/docs/nvdimm.txt
>
>
>
> >
> >> The libpmem has architecture specific instructions like dcbf on POWER
> > Which "libpmem" is this? PMDK is a reference library not a PMEM
> > interface... maybe I'm missing what libpmem has to do with QEMU?
>
>
> I was referrering to semantics of flushing pmem cache lines as in
>
> PMDK/libpmem.
>
>
> >
> >> to flush the cache data to backend nvdimm device during normal writes
> >> followed by explicit flushes if the backend devices are not synchronous
> >> DAX capable.
> >>
> >> Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
> >> and the subsequent flush doesn't traslate to actual flush to the backend
> > s/traslate/translate/
> >
> >> file on the host in case of file backed v-nvdimms. This is addressed by
> >> virtio-pmem in case of x86_64 by making explicit flushes translating to
> >> fsync at qemu.
> > Note that virtio-pmem was a proposal for a specific optimization of
> > allowing guests to share page cache. The virtio-pmem approach is not
> > to be confused with actual persistent memory.
> >
> >> On SPAPR, the issue is addressed by adding a new hcall to
> >> request for an explicit flush from the guest ndctl driver when the backend
> > What is an "ndctl" driver? ndctl is userspace tooling, do you mean the
> > guest pmem driver?
>
>
> oops, wrong terminologies. I was referring to guest libnvdimm and
>
> papr_scm kernel modules.
>
>
> >
> >> nvdimm cannot ensure write persistence with dcbf alone. So, the approach
> >> here is to convey when the hcall flush is required in a device tree
> >> property. The guest makes the hcall when the property is found, instead
> >> of relying on dcbf.
> >>
> >> A new device property sync-dax is added to the nvdimm device. When the
> >> sync-dax is 'writeback'(default for PPC), device property
> >> "hcall-flush-required" is set, and the guest makes hcall H_SCM_FLUSH
> >> requesting for an explicit flush.
> > I'm not sure "sync-dax" is a suitable name for the property of the
> > guest persistent memory.
>
>
> sync-dax property translates ND_REGION_ASYNC flag being set/unset

Yes, I am aware, but that property alone is not sufficient to identify
the flush mechanism.

>
> for the pmem region also if the nvdimm_flush callback is provided in the
>
> papr_scm or not. As everything boils down to synchronous nature
>
> of the device, I chose sync-dax for the name.
>
>
> >   There is no requirement that the
> > memory-backend file for a guest be a dax-capable file. It's also
> > implementation specific what hypercall needs to be invoked for a given
> > occurrence of "sync-dax". What does that map to on non-PPC platforms
> > for example?
>
>
> The backend file can be dax-capable, to be hinted using "sync-dax=direct".

All memory-mapped files are "dax-capable". "DAX" is an access
mechanism, not a data-integrity contract.

> When the backend is not dax-capable, the "sync-dax=writeback" to used,

No, the qemu property for this shuold be a separate device-type.

> so that the guest makes the hcall. On all non-PPC archs, with the
>
> "sync-dax=writeback" qemu errors out stating the lack of support.

There is no "lack of support" to be worried about on other archs if
the interface is explicit about the atypical flush arrangement.

>
>
> >   It seems to me that an "nvdimm" device presents the
> > synchronous usage model and a whole other device type implements an
> > async-hypercall setup that the guest happens to service with its
> > nvdimm stack, but it's not an "nvdimm" anymore at that point.
>
>
> In case the file backing the v-nvdimm is not dax-capable, we need flush
>
> semantics on the guest to be mapped to pagecache flush on the host side.
>
>
> >
> >> sync-dax is "unsafe" on all other platforms(x86, ARM) and old pseries machines
> >> prior to 5.2 on PPC. sync-dax="writeback" on ARM and x86_64 is prevented
> >> now as the flush semantics are unimplemented.
> > "sync-dax" has no meaning on its own, I think this needs an explicit
> > mechanism to convey both the "not-sync" property *and* the callback
> > method, it shouldn't be inferred by arch type.
>
>
> Yes. On all platforms the "sync-dax=unsafe" meaning - with host power
>
> failure the host pagecache is lost and subsequently data written by the
>
> guest will also be gone. This is the default for non-PPC.

The default to date has been for the guest to trust that an nvdimm is
an nvdimm with no explicit flushing required. It's too late now to
introduce an "unsafe" default.

>
>
> On PPC, the default is "sync-dax=writeback" - so the ND_REGION_ASYNC
>
> is set for the region and the guest makes hcalls to issue fsync on the host.
>
>
> Are you suggesting me to keep it "unsafe" as default for all architectures
>
> including PPC and a user can set it to "writeback" if desired.

No, I am suggesting that "sync-dax" is insufficient to convey this
property. This behavior warrants its own device type, not an ambiguous
property of the memory-backend-file with implicit architecture
assumptions attached.
