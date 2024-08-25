Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp664514njb;
        Sat, 24 Aug 2024 20:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIxhK0B0j7e98jgcBMOIHfVy/WXUP81sMsvoKGuEtrb11hUHrrkIfgT9pKmIvN1BAhrQGkhut1IAcU9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH0l7pLSIWLCoLlIceEaiUX8NDt3+gd+IYaZPaNYzNszOZKcKTLuEF6ZW5Taqa1nTVT0ndt
X-Received: by 2002:a05:6214:459d:b0:6c1:6ae6:85f6 with SMTP id 6a1803df08f44-6c16dec74f8mr76117076d6.57.1724557750657;
        Sat, 24 Aug 2024 20:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724557750; cv=none;
        d=google.com; s=arc-20160816;
        b=LV14TRMCz2lc/gbMqpnwrlU3P3kU9D8p5eSJkBOHrhT1XYxnQhdTiurjs/vCFnjl5+
         CHlcPXfdsrRqEsZJuOZAP6Yvn5REebCz01nYBWHu1etsaqftrmL1MEnWl/PjHvsUQCbr
         86xT006mt9WeEr40n7xHjZZperra2BKpI5l0k2tglAxC35bj2UlxSqPcMal1E3WGpB2t
         oPNjWQFJxNE0u+wClofwn4lFCPd3c8oGJMx2Pacn/2z5TjNa+QXziXIPfdwB1dktKMUH
         wDS26ec44HzqnPu9W6r4OSbQxa79xS6BZVuZ4mCxdLBk7+BSY5VCWPwLD53/IMvSwOuN
         YoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=q3uBX3GafJsijXOwEi4NbY0O+/wwIpyXjEf/F16QN+Q=;
        fh=AJ8hn4ioKJA5lsG3NCMNx8yhntdFUmRi9f6dN5eYbeg=;
        b=fnpgTMZaETbcyiKrBMjehHcVIPeZTYulJo3NkqGVwGvHn7ydbN0MGtpbtOQat2H2HM
         1q/PK95vh68CXkDTP9UcAZ0EqxDUEa+lFhqL3uVvp6xOHAe8+3TjoKkw5V3zMa+pfKQ1
         +J4jnODLlNqovSBxBgXXvtt6cqi0LovkoEyE/44UpNuoQjVJRs2PoUgTg3OmWfZOifQh
         PnpvNQOqylS0M59PvheyX7NGmqdMCZWq4HcIrJOS8h1pv29RzRyKdbu3Ep3dvsOkNhA4
         vCu0qIX53mWhy/WIxEhCLC0sGcCSdAO6WqjJDMmkDXHTiHHJw0UsKIGojGzsrlqOvKQo
         B0yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cU9m02+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162e4d87csi79819376d6.554.2024.08.24.20.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Aug 2024 20:49:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cU9m02+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1si4F4-0005Tk-Mz; Sat, 24 Aug 2024 23:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1si4F3-0005Hq-FJ; Sat, 24 Aug 2024 23:48:37 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1si4Ey-0005Hn-Ht; Sat, 24 Aug 2024 23:48:37 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B19A60C2A;
 Sun, 25 Aug 2024 03:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D72EC32782;
 Sun, 25 Aug 2024 03:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724557711;
 bh=wYgVuEohUFvuJR7BKrYMXwPNC/z0NyGx+4ELX1Susf4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cU9m02+Q+n9ZugrlSKrJO3kJq9i/EDGjwYHvvSXjDN6St7fDBdNzFeg2kTNP7eXpQ
 PaGvOKE+ladpOqXrfG1yDUHWw3b/gTnwP7jdSfWHYJIuVNT9i2Z+UvXJYryyssTTu8
 5IWGzqjwlqwOcuWlyZhUWkjf3Pp2lkDm+YqSCfIzY7FmObj3yqzWQg/HCV1Gy0vfkq
 clvSWadtyQVDElaXntxw9pKuf8CKX90GGAmyUythIk23qoVVLs9r/TPwE0cX34BJah
 3eS/YVBl9QgTknLHBPVfifvJ1KwPLbaBDynVKuJAU9/ZsD82V8JkJNd6ndSqkHPvdG
 3LrgZ6IPU/L0A==
Date: Sun, 25 Aug 2024 05:48:12 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 13/13] acpi/ghes: check if the BIOS pointers for HEST
 are correct
Message-ID: <20240825054812.32f780e5@sal.lan>
In-Reply-To: <20240824021510.71451b57@sal.lan>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
 <52e6058feba318d01f54da6dca427b40ea5c9435.1723793768.git.mchehab+huawei@kernel.org>
 <20240819160733.464ccebf@imammedo.users.ipa.redhat.com>
 <20240824021510.71451b57@sal.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: o71IfTjYhJ50

Em Sat, 24 Aug 2024 02:15:10 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Ok, we could still do something like this pseudo-code to get the
> error source offset:
> 
> 	#define ACPI_HEST_TYPE_GHESV2	11
> 
> 	err_struct_offset = 0;
> 	for (i = 0; i < source_id_count; i++) {
> 		/* NOTE: Other types may have different sizes */
> 		assert(ghes[i].type == ACPI_HEST_TYPE_GHESV2);
> 		if (ghes[i].source_id == source_id)
> 			break;
> 		err_struct_offset += HEST_GHES_V2_TABLE_SIZE;
> 	}
> 	assert (i < source_id_count);

This is what I ended implementing on v9.

Regards,
Mauro
