Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp805177njb;
        Thu, 5 Dec 2024 01:22:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhtbKBJmGM4QbTAcvmPLUCw8hVrClCQDoTFRAEfrC3j0bNzlo9YD3S3DnIcqhw+4JkuX5HKpAWQPceHw==@linaro.org
X-Google-Smtp-Source: AGHT+IGzXd7IxOH0ksNu/xL2ONKCB6olezlLDhfxUI4SIbCMAk0knMGWuX4QXUblL4nNtFSH2roJ
X-Received: by 2002:a05:622a:308:b0:466:a0cf:b06c with SMTP id d75a77b69052e-4670c6fcc56mr189175281cf.56.1733390560888;
        Thu, 05 Dec 2024 01:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733390560; cv=none;
        d=google.com; s=arc-20240605;
        b=H3LjH5r2vTRqO6yXGe67DPBUKBWwKhuncb9/seDRrgO419cwvpkCoI1y6InwZMs+dK
         O7oF6WPoY+D0B4ihyRsyOJTk4GNmSv7CJ7V+zxxcvCOnNOsYv5hOLfG0eoZx0dS8dLgf
         3TpQRCvbPinB50TKlyQvPIgYHwYoJu77JrZSI+FRXW72kn3Bin5Z6ljyaFUN/OQoKI9/
         yInKtk+qc/LIU5gtt32o7unh6fjeiZoSC1+hcRzPG7gtmhFh0WjuN+I0RH70Y/xxxuxF
         YpOJ9806XXvx8nJXpPcHQRr808+LM6dPkdjejbGFi4EWL4FZJ+5K73qxxeg7DONF0HH6
         d0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=dGhsvxIAa/RUDZNcykbYv+PGXT3hSqjfx5KJygYAroU=;
        fh=o52mkOyU13fkXmz2sL2xjFLGE1qOwmR7Nd4rvAiSAM4=;
        b=HVnbQ2jVvuACQVLam7xdB0Bj2VuLN3/0hgOBztLC1+/z78yPDzuUWwtxUXWY001ZFk
         hqQBTcvItv+sAHdQvLGc9w9BhPNSILGIcUCb6HPL/sr+WGG9R8sOYHrUOLz333rinI8B
         0/xuTYrv0mm/rGWmoRcnQRLrn0pliwnQArCokLYN1jMVv6pv9d+o7OHqCJ61Z12OC7OV
         4HqgAer9qWvaQ+auMSxU+OCqJplVbxbCwZLA+LHeguD0fdvVs0j0MZ2JiEEVU5Ar/FZE
         Ol1W4YAzDt6saZaPpHKs1T06S7RxNECMyVEvzX4U8GhBN6/77cAnkV//s+4YgXpCELVJ
         1phQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K9Il8KGE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4672986a8b9si14117131cf.718.2024.12.05.01.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 01:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K9Il8KGE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJ849-0005h7-0N; Thu, 05 Dec 2024 04:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tJ844-0005gB-Dc
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 04:22:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tJ842-00037y-4k
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 04:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733390544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGhsvxIAa/RUDZNcykbYv+PGXT3hSqjfx5KJygYAroU=;
 b=K9Il8KGEbdzQP3F2r5yKWaNp40bCwdWMFnemzY9nw8h4Gvlhwu6j7SGzOjbZtiXf3rJqkD
 TL7AyIxrM8beZW482pQ/L9kd/RH3SENc4tEsLTDiba+gWMOD40hmF1IK2mSZDJKKF3gBkC
 QoQSmyZ2gDJPOSDskfW3pUJuFaKWC8c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-j8oL1mu5NdWfCkzDROPItw-1; Thu, 05 Dec 2024 04:22:22 -0500
X-MC-Unique: j8oL1mu5NdWfCkzDROPItw-1
X-Mimecast-MFC-AGG-ID: j8oL1mu5NdWfCkzDROPItw
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4349c5e58a3so6131445e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 01:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733390541; x=1733995341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGhsvxIAa/RUDZNcykbYv+PGXT3hSqjfx5KJygYAroU=;
 b=p6T5hs6HOvZg1ev31T8NL5Gx/7Tqt3EJ9NQe9f/qMjz0S5JvZC+/oyzKKR54l+hMuE
 3piVoBRR0aMypFM1ZAzaS4Ww+vKzioDzYBI9CnuvQhxeXnsPA2V5Equhb0xp2qZUtzyM
 cgbzFmehyzzwT7e+9PC7I9QvEmAi/frWJ2xc8zAV2N7KXCr+1ujEhIAUdUiKB4ThzBCY
 14K7vw/pkoYj/om6f1OwF1+j7R2fDEJ0Rs6QfyAEYz1zJh/oRRq3xX7P7qhK/hc8FrTT
 D7b+6cVESPlnIKoidFfo9jr+LSTjUBnywdfhR5Ah7YwFR9XpXNhiMpvUEOgPQN4yzM8D
 CQVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3LfveMFAoFV01YlKgQlVmjzc9xx3jzul8pzbvPwR5QgclIOdVkcFDHh23eq2dgsy3OrMN2LWJwg==@nongnu.org
X-Gm-Message-State: AOJu0YzNiSQTdzZyroJTAvEYbX6jCwZ2OsHJv7eGdQU0WPALsMwn3kBl
 4jtwltE+1Tz8JmK+HzVpimdfmBTHsb73REucsNXWw8jpeyzoHGN9RW915bMaj7lpgnJ3KX8DKJl
 uWD+dc1CCKtjsIwyaknn+74Zl0GNzCkppCRBd+A8J4e8sHHpOPg==
X-Gm-Gg: ASbGncvDuEePIpFEBCGCvfbHsmuBB+IUPTxrP/PFh1PYi5nITmkC4YzEsOaBVz/hGCu
 RLPB+BkpJXHRhIQI9e1fuY7GLBO2pREHABFefrADx+WQo9IcT3S/vtbktB+Lc+i8RJMrtZ4Nwrx
 5vtEItdLoso7mmDUCXqXIrOVFK1qn7a6aRRsqc0//qRn8lB1+rfrhgtjhhYAshOEmJr4pvKoJt9
 e9mblrrttylvATTshQgRIQuHiPn4+HUwx+sxdJvnztq58CjYwZ8wSo50ao1TzmkKARxh1ZhcTER
 ynuRa2LQbd0LGvSAKNRiwA==
X-Received: by 2002:a05:600c:4ecf:b0:426:647b:1bfc with SMTP id
 5b1f17b1804b1-434d0a14eb7mr95742315e9.30.1733390541395; 
 Thu, 05 Dec 2024 01:22:21 -0800 (PST)
X-Received: by 2002:a05:600c:4ecf:b0:426:647b:1bfc with SMTP id
 5b1f17b1804b1-434d0a14eb7mr95742175e9.30.1733390541030; 
 Thu, 05 Dec 2024 01:22:21 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52723fasm53651195e9.10.2024.12.05.01.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 01:22:20 -0800 (PST)
Date: Thu, 5 Dec 2024 10:22:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 13/16] acpi/ghes: better name the offset of the
 hardware error firmware
Message-ID: <20241205102219.274e3d27@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241205085959.2223d079@foz.lan>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
 <20b003136d8c008fd54e8d40c806f13867336e13.1733297707.git.mchehab+huawei@kernel.org>
 <20241204173759.6f02561a@imammedo.users.ipa.redhat.com>
 <20241205085959.2223d079@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: puWFtYBIiucLUGLYarIFweFZlvk2q6iYYw3Jnhy2gdo_1733390541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2kTXWHq3TLzb

On Thu, 5 Dec 2024 08:59:59 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 4 Dec 2024 17:37:59 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Wed,  4 Dec 2024 08:41:21 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > The hardware error firmware is where HEST error structures are    
> >       ^^^^^^^^^^^^^^^^^^^^^^^ I can't parse this, suspect you've meant something else here
> >   
> > > stored. Those can be GHESv2, but they can also be other types.
> > > 
> > > Better name the location of the hardware error.
> > > 
> > > No functional changes.  
> 
> I meant this fw_cfg file:
> #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
> #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
> 
> What about changing description to:
> 
> 	The etc/hardware_errors fw_cfg file is where the HEST error
> 	source structures are stored. Those can be GHESv2, but they can also
> 	be other types.

As I understand it, etc/hardware_errors is a blob
for '18.3.2.7.1. Generic Error Data' with some extra fields
to accommodate GHESv2 handling (i.e. err addr indirection and ack reg).

While error sources are described in HEST (and only GHES ones would
reference  etc/hardware_errors via error status addr/read ack register addr)

> 
> 	For more details about error source structure, see:
> 	https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#acpi-error-source
> 
> 	Better name the address variable from ghes_error_le to hw_error_le
> 	to better reflect that.
> 
> 	No functional changes.
> 
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  hw/acpi/generic_event_device.c | 4 ++--
> > >  hw/acpi/ghes.c                 | 4 ++--
> > >  include/hw/acpi/ghes.h         | 2 +-
> > >  3 files changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > index 663d9cb09380..17baf36132a8 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -364,7 +364,7 @@ static const VMStateDescription vmstate_ghes = {
> > >      .version_id = 1,
> > >      .minimum_version_id = 1,
> > >      .fields = (const VMStateField[]) {
> > > -        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
> > > +        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
> > >          VMSTATE_END_OF_LIST()
> > >      },
> > >  };
> > > @@ -372,7 +372,7 @@ static const VMStateDescription vmstate_ghes = {
> > >  static bool ghes_needed(void *opaque)
> > >  {
> > >      AcpiGedState *s = opaque;
> > > -    return s->ghes_state.ghes_addr_le;
> > > +    return s->ghes_state.hw_error_le;
> > >  }
> > >  
> > >  static const VMStateDescription vmstate_ghes_state = {
> > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > index 52c2b69d3664..90d76b9c2d8c 100644
> > > --- a/hw/acpi/ghes.c
> > > +++ b/hw/acpi/ghes.c
> > > @@ -359,7 +359,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> > >  
> > >      /* Create a read-write fw_cfg file for Address */
> > >      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
> > > -        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
> > > +        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
> > >  
> > >      ags->present = true;
> > >  }
> > > @@ -385,7 +385,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> > >      }
> > >      ags = &acpi_ged_state->ghes_state;
> > >  
> > > -    start_addr = le64_to_cpu(ags->ghes_addr_le);
> > > +    start_addr = le64_to_cpu(ags->hw_error_le);
> > >  
> > >      start_addr += source_id * sizeof(uint64_t);
> > >  
> > > diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> > > index 21666a4bcc8b..39619a2457cb 100644
> > > --- a/include/hw/acpi/ghes.h
> > > +++ b/include/hw/acpi/ghes.h
> > > @@ -65,7 +65,7 @@ enum {
> > >  };
> > >  
> > >  typedef struct AcpiGhesState {
> > > -    uint64_t ghes_addr_le;
> > > +    uint64_t hw_error_le;
> > >      bool present; /* True if GHES is present at all on this board */
> > >  } AcpiGhesState;
> > >      
> >   
> 
> 
> 
> Thanks,
> Mauro
> 

