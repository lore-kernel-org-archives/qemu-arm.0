Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2554222lfm;
        Tue, 16 Jun 2020 05:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPIHCukwfajYomREaN0S0fpEvJ+Yfbn/LjIFBlc491S457IBOWsBzzPbCctSMLjjgJTlCf
X-Received: by 2002:a25:b51:: with SMTP id 78mr3760709ybl.186.1592309222935;
        Tue, 16 Jun 2020 05:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592309222; cv=none;
        d=google.com; s=arc-20160816;
        b=AHGpWRLqtFguQcqr8Vy7IiYMXjMoGxG1/s5VK0Cec8AzyLoeqT6dHYfja62U9zDucm
         mjlOAjVkBy0Uyr4JTZqpwwwiGbV0jQKH/0dN56ejlItmEos9iLzDiRB3ilBASXph1n6u
         ivKcOsGpas/KM0cPrE4UVfaokq0pcqu0F8OC74cEWXgs/im/TSUtrLYf7aUTWJQ0ikvI
         7JiTzJvQmNr/OL6P1E3v9Q/tbTbuTWzuz55AJBm98i1YPUJ9i07Y3bF3tHAZ2hEW0rek
         7ZSiFe3+mPvhdX7ukMrkVWEBl6xZXzboEpwfXqE2wPpAUnZPeeq7hMQWJIfqPBE9UkeG
         PJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=SfTCpQF9W4sCdZ61TrxmHwYeLq4dXGY+QB87Bb/+irg=;
        b=xemKmD1HRG6c30pX2AyinknGMvn6fkmBqk+Nv8TGu74oY3L0uepNYkCVz0P1pLFbQA
         8gANkNaRym12+BYJKs/CuCSAxQUx/cmOJefoqbP2r+QDUMSWLZJO3x9xvAVu8JyQXEHM
         dxwVxVnYinfm55RLVJ/4tzVM1SxaRw9MEqrSlc0OHW3yfFTUujbe35MWS4NPHJk6PnEF
         ZVO1BkRnU7E5tVh1iAFJ3sVk563sxoyd6c+k3nUf90NUb/FtCW+MynpYuWig6+xZen/u
         sywiOgWJ0mUUweb4GbInvPYlLLA4myalS8cPC1VyMqk49dRAONq7Ju5xrdeTxBfklo9b
         LnXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fNX7IJRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si15906935ybg.401.2020.06.16.05.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 05:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fNX7IJRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlAMo-0000Fs-CX
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 08:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jlAMg-0000E0-Fe
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 08:06:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jlAMf-00019b-2G
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 08:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592309212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfTCpQF9W4sCdZ61TrxmHwYeLq4dXGY+QB87Bb/+irg=;
 b=fNX7IJRnlWs0Opy06odAsKgvPhq0O5JK6cKG7IrXdukh+CwaKGXS/muUgyY+1cYeZGyqSt
 TXp0/QDEoO1Sprywb6hKu4rfFw+KkgyomsuaoYys7qjYVUiqaFmkevOv0lplnGUhcQJz4v
 6NgTs46cFI7gCHLOV9N68z0vdn+IW18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-HkgJBQEMMuKYRPr-IHti0Q-1; Tue, 16 Jun 2020 08:06:46 -0400
X-MC-Unique: HkgJBQEMMuKYRPr-IHti0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4BA2210C2;
 Tue, 16 Jun 2020 12:06:45 +0000 (UTC)
Received: from localhost (unknown [10.40.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D51B07FE82;
 Tue, 16 Jun 2020 12:06:21 +0000 (UTC)
Date: Tue, 16 Jun 2020 14:06:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
Message-ID: <20200616140620.15246816@redhat.com>
In-Reply-To: <28121558-7a75-73da-6939-da0c0e776087@linux.ibm.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <28121558-7a75-73da-6939-da0c0e776087@linux.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 philmd@redhat.com, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /fRHK5XI/Kz3

On Thu, 11 Jun 2020 10:25:38 -0400
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 6/11/20 9:59 AM, Eric Auger wrote:
[...]
> > -    tpm2_ptr->log_area_minimum_length =
> > -        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
> > +    /* Platform Specific Parameters */
> > +    g_array_append_vals(table_data, &start_method_params,
> > +                        ARRAY_SIZE(start_method_params));
> >   
> > -    acpi_data_push(tcpalog, le32_to_cpu(tpm2_ptr->log_area_minimum_length));
> > +    /* Log Area Minimum Length */
> > +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);  
> 
> Here you push data related to TPM2 table...
> 
> 
> > +
> > +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);  
> 
> ... here you push log area memory ...
> 
> 
> >       bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
> >                                false);
> >   
> > -    /* log area start address to be filled by Guest linker */
> > +    log_addr_offset = table_data->len;
> > +    build_append_int_noprefix(table_data, 0, 8);  
> 
> 
> ... here you push TPM2 table related data again. Is this right or did we 
> just mess up the TPM 2 table?

it's 2 differnt blobs tcpalog and table_data

> 
> 
> > +    /* Log Area Start Address to be filled by Guest linker */
> >       bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> > -                                   log_addr_offset, log_addr_size,
> > +                                   log_addr_offset, 8,
> >                                      ACPI_BUILD_TPMLOG_FILE, 0);
> >       build_header(linker, table_data,
> > -                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
> > +                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
> >   }
> >   
> >   #define HOLE_640K_START  (640 * KiB)  
> 
> 

