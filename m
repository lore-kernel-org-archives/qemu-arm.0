Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B74CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 09:45:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFr7i-0001Ka-6x; Mon, 03 Nov 2025 04:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vFr7g-0001KG-Fs
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 04:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vFr7e-00063c-5S
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 04:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762163108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtBIKTpv4o1EKAk97fV4bR7w0PUyneRCBxrQbcM9y+w=;
 b=jAMN31gDyCkOczNLs0vUhHNA7hzEr9uenG56oTdckWR4NXR4XaR7zsd0PQ2us40FzS35+G
 xMbenvGILoNPkvH8oqvuGMB6+IPcB5EkumoZu3Oe/RDHE8Nz5SvqXZFTBDKppU9iYU2ZwH
 d7VqD+NT2LQGxUunD0xPco8pdfuo4wY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222--C-lTLpNP6-AGoOClRIZcw-1; Mon, 03 Nov 2025 04:45:07 -0500
X-MC-Unique: -C-lTLpNP6-AGoOClRIZcw-1
X-Mimecast-MFC-AGG-ID: -C-lTLpNP6-AGoOClRIZcw_1762163105
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429ce8ac89bso527562f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 01:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762163105; x=1762767905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qtBIKTpv4o1EKAk97fV4bR7w0PUyneRCBxrQbcM9y+w=;
 b=HWBZW+UeO0PiFEgCpXGNLREb4jAcSWU962qUfjRRzE+YZseXTBrj/ib2QgIZseGWSo
 fVuuDpxcVyHrlqHOL6ahJJqoeNWI4+oUS0k3D/iFfhMvYhI9+yZMZgYBYjtCvF7bVzZL
 RgEG81s4tOLq8C0XGgpuyrICqTLizsrx/9LPlJP0bE9Kl3lXYlghLpL2sRSeTx2rYf8B
 9arO9W2fyfIVbAX5Jj8gGR9te8tpwF1YuhR1Ev9arAjGtdaO40/45n6zZ1nkoPcxJAj/
 b90Vgz4WQvry3aoqIN6jm+jy1PEWJ09qcwTL0qlibTsgJD9fXfgLaKY+fzzpBzrAqaio
 if0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYmXAKPFJMkRYPnOdvYgbCmozkcSlW+UnqyLgB/X/9cnuFKoMmFywGDb1l74M16dk8HlvIRWmqGg==@nongnu.org
X-Gm-Message-State: AOJu0YxDOAbo1tyxmD17NH1GUmy5G/deHZJP9qoIzDHPDfIytV7tdW6D
 r75nt51H6n9jw7RWVW9E2d2eWuWeCWaGo0fKjXtKSTxADQC0MvNtAMNtvkXYanzcppPlz3YBlI5
 2rtUBybTX4ieeN9VjxGQgKetLum1VNOsdH7z0RKvQZIY41sJMmuV4fA==
X-Gm-Gg: ASbGncs5JbtLhEpK8Koa/JvEpRrEQpzF1nVmGTesngRdJM2s0bN8ROyz7l/wiBzsIGK
 CvW6mMjQ1BbFsdSB8NLHVZmADgQpkW7Z4xLj3x4gAFi2KoZNxKVWDY40Pr5eWgxlw++1FxWNq6T
 7Q+4rBs3Y145UQNBhIF17GJFCqDgxXoh8EbyKnCLYhmlfHzt/jkd6Fh5DrXD6ARsnfoODdpYhtA
 Y+AO4LQvva7tzNoGR2QvTH/jMAnJPuD+ohdIhXwsCKtbfde1NZUAlcSIKNVVYJTRDyEyd9omheK
 RH71sEFYlE4LbMUj7NNRvMGubYUq7tMUZCGe39tBqFI45YoGw252Gp6Ep+wjEwBwoQ==
X-Received: by 2002:a5d:64e7:0:b0:429:9323:2bec with SMTP id
 ffacd0b85a97d-429bd6a4bf4mr10227657f8f.40.1762163105418; 
 Mon, 03 Nov 2025 01:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI/Isnfg5IO61hQnMfkvDjvv0RDoI80m7l4TDxEsJsZtZEY/2w9MLpoLR0XQPsOEC69ZDByg==
X-Received: by 2002:a5d:64e7:0:b0:429:9323:2bec with SMTP id
 ffacd0b85a97d-429bd6a4bf4mr10227619f8f.40.1762163104889; 
 Mon, 03 Nov 2025 01:45:04 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c5e19103sm16181204f8f.28.2025.11.03.01.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 01:45:04 -0800 (PST)
Date: Mon, 3 Nov 2025 10:45:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 mchehab+huawei@kernel.org, shan.gavin@gmail.com
Subject: Re: [PATCH RESEND v2 2/3] kvm/arm/kvm: Introduce helper
 push_ghes_memory_errors()
Message-ID: <20251103104503.748381a4@fedora>
In-Reply-To: <fcf84423-9675-4293-9552-ac5f09acf171@redhat.com>
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-3-gshan@redhat.com>
 <20251031100901.00000ccf@huawei.com>
 <fcf84423-9675-4293-9552-ac5f09acf171@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -jVQKPsqfa3vKUcaKhqAGvnDHaansnDXE_vu_MbLq60_1762163105
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 3 Nov 2025 09:39:50 +1000
Gavin Shan <gshan@redhat.com> wrote:

> On 10/31/25 8:09 PM, Jonathan Cameron wrote:
> > On Tue,  7 Oct 2025 16:08:09 +1000
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> Introduce helper push_ghes_memory_errors(), which sends ACPI GHES memory
> >> errors, injects SEA exception or aborts on errors. This function will
> >> be extended to support multiple ACPI GHES memory errors in the next
> >> path.
> >>
> >> No functional changes intended.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   target/arm/kvm.c | 36 ++++++++++++++++++++++++------------
> >>   1 file changed, 24 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> >> index 9a47ac9e3a..c5d5b3b16e 100644
> >> --- a/target/arm/kvm.c
> >> +++ b/target/arm/kvm.c
> >> @@ -2429,12 +2429,34 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
> >>       return ret;
> >>   }
> >>   
> >> +static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
> >> +                                    uint64_t paddr)  
> > 
> > Why not hwaddr paddr?
> >   
> 
> Because acpi_ghes_memory_errors() accepts it as uint64_t.

ack to that, it's uint64_t in spec so I'd stick to that.

> >> +{
> >> +    GArray *addresses = g_array_new(false, false, sizeof(paddr));  
> > 
> > As in previous I'd just have
> > 	hwaddr paddrs[16];
> > 
> > rather than bothering with a g_array.
> >   
> 
> Ok.
> 
> >> +    int ret;
> >> +
> >> +    kvm_cpu_synchronize_state(c);
> >> +    g_array_append_vals(addresses, &paddr, 1);
> >> +    ret = acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses);
> >> +    if (ret) {
> >> +        goto error;
> >> +    }
> >> +
> >> +    kvm_inject_arm_sea(c);
> >> +
> >> +    g_array_free(addresses, true);
> >> +
> >> +    return;
> >> +error:
> >> +    error_report("failed to record the error");  
> > 
> > I'd just do this inline at the error case. In the next
> > patch you add a more specific report of why to another path
> > that would then be followed by this.
> >   
> 
> Ok.
> 
> >> +    abort();  
> > 
> > If you do the above with the message, just duplicate this in the
> > two error paths (by end of next patch).
> >   
> 
> Will correct this in next revision if we still take current design. Igor suggested
> to have individual error source per vCPU in another thread.
> 
> >> +}  
> >   
> 
> Thanks,
> Gavin
> 


