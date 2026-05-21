Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825BCCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:25:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3PM-00063B-Cj; Thu, 21 May 2026 09:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3PG-0005yY-Hm
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3P9-00030u-Qv
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779369933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bthRsReiJ6bBSDWfUl4C+rA7io2uCIvhq3b4X9FNb5Y=;
 b=gxXx6/zNFcaZoErm0bDGsvfXGeAI/5KzFMc6kYsn1S11qRMjmDvsb/shxWdv1yVe19zjRp
 ZBkiF+umWvkQ95cq/VWH6Tq6F2y8DNpRrd0nnvGxBljMvepoRUMb4YwMR6Valhio8yhc2x
 PpfPuDdUkZbhdtaBGoriVsGFYo5pMuk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-_ZAx201vP5eeBndp5UYLcA-1; Thu, 21 May 2026 09:24:02 -0400
X-MC-Unique: _ZAx201vP5eeBndp5UYLcA-1
X-Mimecast-MFC-AGG-ID: _ZAx201vP5eeBndp5UYLcA_1779369820
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-447f2ce5556so4872232f8f.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369820; x=1779974620;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bthRsReiJ6bBSDWfUl4C+rA7io2uCIvhq3b4X9FNb5Y=;
 b=hI5eo2s/r2skwmxoXQTx0BE4EzavhkyN8ORj+qn7brlL3DTpYMqqi5cJKgh0zFEap1
 7Vd76qCllXclSs0nD5q/BH60ZtE4p4tzgdfK8Gjjsj0PbVLZpTWIHM8JoM5I4784Wej+
 tPW16kEyMxtKw5x+LsD1miLjwcKOS1S/pZX0Earc+p6UiY8g3x3hmf3MPQdnfTyBDrG3
 eM8FBRbO9hW4KTxDuIit0AjqjkYgR5deVvdlEP6e8X+sW5rpShQBcMsuIAYCywOdxrSv
 QApMPWZqgexFRV0K8ItEUZbu2adUa7+974jTecCktcK6IhkHKBl+O2mrzFP9ta0q9UIo
 4cSg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+E+7R+Rlo1etLmQ18kWnMvyLcYHZqsd0CbE9iUauOU2FfL/igSlD42ktJuZYKU1xXe8PH4O5DxYA==@nongnu.org
X-Gm-Message-State: AOJu0YzOo0aiZPd8OzAHBtPV5PhTzx8DfBbJFE6OXLy3TfGqC9+0UU/k
 YBFxeW8M/gqMrQNJKcIxG5qs7QeC7MNPom8+F30GPs/+n6KhLDCou7rC0TmfKBNMktJxoukUhYg
 m+9XXCAoCXD21C5flZOOUPkaaXpQiO3G9SDgPHQRVBqECtOouKWUoew==
X-Gm-Gg: Acq92OFXy343Nj4IClDv8z515F8MFAhzHEiMMTPGSpwfsAstD+HsqGk8NJxH53eOo3y
 DV48JY9wrYdoG8B60uWY7BKoE7tKte8jHIvERJHErivWHw3kcqSXnSAUaXCwxc/WJYb87MH6Q/d
 v/q2FRUuK/84NPjWLecHlhVLIuIwUhoS4EeidU6/L/SM+uPbFZfsY0FXwKkHufrYKvzj4FgWKsT
 3JQkTNyqYVGt29Uqoik/n4xoyaTMmvFw/T58U88n4CM3O29r4igdGDlxMGNkNZvx/7LOK/2TKLa
 TOgeiD52hetK/yqC2r9TxdtTZ6AKaUwsfpU3/oqhinyNVg1Z+l9lUVyf44IcmKyGsLshkvr1UPd
 DTE/NTHsAK8m8QsRfeqLM7VXiwIigOVj2UONlNlMoDApJ7HKoARlnhE3zci6Zm88BOWBu42do+6
 68KPb/1A==
X-Received: by 2002:a05:6000:4808:b0:44d:1338:46b4 with SMTP id
 ffacd0b85a97d-45ea36b42d0mr5074880f8f.9.1779369819903; 
 Thu, 21 May 2026 06:23:39 -0700 (PDT)
X-Received: by 2002:a05:6000:4808:b0:44d:1338:46b4 with SMTP id
 ffacd0b85a97d-45ea36b42d0mr5074819f8f.9.1779369819402; 
 Thu, 21 May 2026 06:23:39 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa93630asm2673560f8f.25.2026.05.21.06.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:23:39 -0700 (PDT)
Date: Thu, 21 May 2026 15:23:37 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 04/18] arm/cpu: Add infra to handle generated ID
 register definitions
In-Reply-To: <20260519132905.145643-5-eric.auger@redhat.com>
Message-ID: <c0644ecb-fc85-3180-e11e-99ec154a6e15@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-5-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qStwIDLQpPj0hHdR_ddvj5YI9tr0N2_iCNHbRXplW4s_1779369820
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 19 May 2026, Eric Auger wrote:
> The known ID regs are populated in a new initialization function
> named initialize_cpu_sysreg_properties(). That code will be
> automatically generated from AARCHMRS Registers.json. For the
> time being let's just describe a single id reg, CTR_EL0. In this
> description we only care about non RES/RAZ fields, ie. named fields.
>
> The registers are populated in an array indexed by ARMIDRegisterIdx
> and their fields are added in a sorted list.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


