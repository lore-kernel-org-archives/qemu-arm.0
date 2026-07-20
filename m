Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC429C4452D
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 19:56:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlu6W-0005D2-05; Mon, 20 Jul 2026 15:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wlu6G-00058q-Tw
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 15:56:29 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wlu6D-0004Un-9q
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 15:56:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-38dcbade417so8703654a91.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784577383; x=1785182183; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qypg8MG/GYHcwh7ZOfCoQhkX/up+rVzHDtc/xpQiT9M=;
 b=wxbgm27/tawmPt+lWeixx/bj030itP5woSc/CbCrisrL951AxAuuqxLyWe7CMDpSAT
 6xJzjflo26wdXfO5H8vZqefmzFvfzGGAVBW6k4pnedBFwfg1/TbjgtiS2QAVIy2KhwE/
 mMvrLa1rFRy6wyV0ud2qaPBcOtUc+8EZA03Txu8FyOzK18PAZkFMzAe75kyN01naLS++
 duecCpKBoIIcBqXHbZFLPyBivzXzWUUVnLfOAqVIfot4DHqLx0sPPbu+iCTieHajc93B
 9DW1ScHwYfXo6ELt3zwHawJCALgUuWfSDQueUQxOp7tF6Lb3DSN2Rlf0f3gEK24cqc6+
 llfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784577383; x=1785182183;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qypg8MG/GYHcwh7ZOfCoQhkX/up+rVzHDtc/xpQiT9M=;
 b=FgSNzxIvK0CKlbOfnxa2yvmKJFT6eX2Ig99tqG6SsLYMOgP+7w7uOPrkvVg8+kT9yr
 WrAUnp/TphNWKUSD0WcfZqxqRrnnB0wmnkU8Z6rhtjSSeSJEoDzjUrnRltg5JmUxx3Dq
 jcu7MxADf+Q6MdvnchlDvFaXbng9wU0gphkLoQaaQo3njYOpfrEQXno6xCFLL3hN0MG5
 SZU8wb1DTCeZHdMxuy+8eQCjXpe5hBivEcc8KPfNHi7ShNs3KDQwN1pl38eh/JTSVjHA
 PZGfgWcuJI6N9Yf3ZJqlhVM58C7n0G+Tl1cbqn7I07VYNgyj71tQ/PKCHc90T7w2hwLn
 IBfg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpomg8c/p4eqfyk2jFtF3keOgoPQXNIk93o7lv4+/bQlX4DY3r7KKkW1iW1xvTXR45goVPqz56gJQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxEfn1pFwhReiD98VFS+PdsBpQCMRqBHFONsiv+MnqvO1pMe82
 fmhPGCr/I3jtfyL5j/4ZkTHlTMzA0M+NYVDC8IJPGKMx6xwwubuUVVNI/vK3RZHrXnc=
X-Gm-Gg: AR+sD10qZYnlYdNEtpQ5mtImyeN23Vo5pgTHoZxLLZ7Xj8hD8NSYXhfCV7XrRyN3Gjo
 rhxruuRAuKEvxrmtALccD5v+Wr3Ne6yw3QhyPZ7NodMnm6pQKeFtdysZosvi9ua2n6aTisI5mTp
 KqLe2TW46GdPIKWVaVoJhvJFvMkfOa9zPjQDpha2vCLN5a47DWvABQtolsIlYU6/Vg4CahEnJC7
 UaFHW/U6dP9uegNs7FBnCwhNY6Rw7LnrCRBIERa3xAVmPXyEcVOcTAR6ItFeLgjTVXXwIxio70z
 CcIq0YMc9n/wry1dXETXsY21lduglKx1hAXVot6onY4vGdzPFO0M3CcfPpIkc51x+0am0MqQNLs
 yaHsqkZMipURbnqjrg4ICLXR28KmZMhjH4S02VDegA5zWY68U1xa+YzfVvKOofA0rKCnfUSe3rB
 OXo8Bb
X-Received: by 2002:a17:90b:1f88:b0:37f:9cdf:f0ac with SMTP id
 98e67ed59e1d1-38e4b538984mr16982634a91.27.1784577383024; 
 Mon, 20 Jul 2026 12:56:23 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:966a:e23:19e7:951a])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e9237a26asm224764a91.14.2026.07.20.12.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 12:56:22 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:56:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v1 10/25] hw/core/loader: Add a ROM loader notifier
Message-ID: <al59Y0S_DLMbAESK@p14s>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-11-mathieu.poirier@linaro.org>
 <47136344-8e15-498a-a4fb-0dbbb0c71861@redhat.com>
 <allIviFWgoKgDob1@p14s>
 <2ad36e97-63d7-4464-b909-2a28d496e887@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ad36e97-63d7-4464-b909-2a28d496e887@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Jul 20, 2026 at 04:47:53PM +1000, Gavin Shan wrote:
> On 7/17/26 7:10 AM, Mathieu Poirier wrote:
> > On Tue, Jul 14, 2026 at 08:52:43PM +1000, Gavin Shan wrote:
> > > On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> > > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > 
> > > > Add a function to register a notifier that is invoked when ROMs get
> > > > loaded into guest memory.
> > > > 
> > > > It will be used by Arm confidential guest support, in order to register
> > > > all blobs loaded into memory with KVM, so that their content is moved
> > > > into Realm state and measured into the initial VM state.
> > > > 
> > > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > ---
> > > >    hw/core/loader.c         | 15 +++++++++++++++
> > > >    include/hw/core/loader.h | 17 +++++++++++++++++
> > > >    2 files changed, 32 insertions(+)
> > > > 
> > > > diff --git a/hw/core/loader.c b/hw/core/loader.c
> > > > index 5cbfba0a86d2..b3d769bec5cb 100644
> > > > --- a/hw/core/loader.c
> > > > +++ b/hw/core/loader.c
> > > > @@ -74,6 +74,8 @@
> > > >    #endif
> > > 
> > > The (edk2) firmware for the realm guest can be specified by the legacy
> > > '-drive if=pflash' or '-bios'. The memory region corresponding to the
> > > firmware image specified by '-bios' is recorded by the newly added notifier
> > > and populated to TF-RMM properly.
> > > 
> > > I don't see how the memory region corresponding to (edk2) firmware image
> > > specified by '-drive if=pflash' is recorded and populated to TF-RMM
> > > accordingly in this series. So I guess '-drive if=pflash' isn't supported
> > > yet?
> > 
> > Please give '-drive if=pflash' a try and let me know how you fare.  Edk2 is not
> > part of the bootstack I'm currently testing with but I know of configurations
> > where it does work.
> > 
> > I'll add it to my list of things to do if it doesn't work, though I may not
> > address it in this patchset.  We'll see how busy things get.
> > 
> 
> Ok, I don't think '-driver if=pflash' or the 'pflash0' property of the virt machine
> aren't supported any more due to [RFC v1 21/25], where the 'pflash0' property has
> been removed.
> 
>   [RFC v1 21/25] hw/arm/virt: Use RAM instead of flash for confidential guest firmware
> 
> - Tried to boot the realm guest with '-driver if=pflash' and I was told it's not supported.
> 
>   qemu-system-aarch64: -drive if=pflash,format=raw,unit=0,file=/mnt/edk2/Build/ArmVirtQemu-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd,readonly=on: machine type   does not support if=pflash,bus=0,unit=0
> 
> - Tried to use 'pflash0' property, and I was told it's not supported either.
> 
>   qemu-system-aarch64: Property 'virt-11.1-machine.pflash0' not found
> 
> So the only option to specify the firmware image is '-bios', which worked for me.

Thanks for the follow-up.

> 
> Thanks,
> Gavin
> 
> 
> > > 
> > > Note that I didn't give '-drive if=pflash' a try yet.
> > > 
> > > >    static int roms_loaded;
> > > > +static NotifierList rom_loader_notifier =
> > > > +    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
> > > >    /* return the size or -1 if error */
> > > >    int64_t get_image_size(const char *filename, Error **errp)
> > > > @@ -1201,6 +1203,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
> > > >        return mr;
> > > >    }
> > > > +void rom_add_load_notifier(Notifier *notifier)
> > > > +{
> > > > +    notifier_list_add(&rom_loader_notifier, notifier);
> > > > +}
> > > > +
> > > >    /* This function is specific for elf program because we don't need to allocate
> > > >     * all the rom. We just allocate the first part and the rest is just zeros. This
> > > >     * is why romsize and datasize are different. Also, this function takes its own
> > > > @@ -1242,6 +1249,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
> > > >    static void rom_reset(void *unused)
> > > >    {
> > > >        Rom *rom;
> > > > +    RomLoaderNotifyData notify;
> > > >        QTAILQ_FOREACH(rom, &roms, next) {
> > > >            if (rom->fw_file) {
> > > > @@ -1290,6 +1298,13 @@ static void rom_reset(void *unused)
> > > >            address_space_flush_icache_range(rom->as, rom->addr, rom->datasize);
> > > >            trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
> > > > +
> > > > +        notify = (RomLoaderNotifyData) {
> > > > +            .addr = rom->addr,
> > > > +            .len = rom->datasize,
> > > > +            .as = rom->as,
> > > > +        };
> > > > +        notifier_list_notify(&rom_loader_notifier, &notify);
> > > >        }
> > > >    }
> > > > diff --git a/include/hw/core/loader.h b/include/hw/core/loader.h
> > > > index d9431e8a8d12..94cf6ad2e26b 100644
> > > > --- a/include/hw/core/loader.h
> > > > +++ b/include/hw/core/loader.h
> > > > @@ -342,6 +342,23 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
> > > >    ssize_t rom_add_vga(const char *file);
> > > >    ssize_t rom_add_option(const char *file, int32_t bootindex);
> > > > +typedef struct RomLoaderNotifyData {
> > > > +    /* Address of the blob in guest memory */
> > > > +    hwaddr addr;
> > > > +    /* Length of the blob */
> > > > +    size_t len;
> > > > +    /* Address space of the blob */
> > > > +    AddressSpace *as;
> > > > +} RomLoaderNotifyData;
> > > > +
> > > > +/**
> > > > + * rom_add_load_notifier - Add a notifier for loaded images
> > > > + *
> > > > + * Add a notifier that will be invoked with a RomLoaderNotifyData structure for
> > > > + * each blob loaded into guest memory, after the blob is loaded.
> > > > + */
> > > > +void rom_add_load_notifier(Notifier *notifier);
> > > > +
> > > >    /* This is the usual maximum in uboot, so if a uImage overflows this, it would
> > > >     * overflow on real hardware too. */
> > > >    #define UBOOT_MAX_DECOMPRESSED_BYTES (64 << 20)
> > > 
> > > Thanks,
> > > Gavin
> > > 
> > 
> 

