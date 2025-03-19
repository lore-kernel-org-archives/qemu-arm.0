Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp167877njc;
        Wed, 19 Mar 2025 04:43:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2+KROPLBpDeycq3S+mdStSsk3wQUn/kjnREgfGM1C5iVYSML8oLzpL+/wSluwMPpJbcQJdIPcDZqHiw==@linaro.org
X-Google-Smtp-Source: AGHT+IGdw2fnaUaP50UzusjqsRfIem4c02+yEcbL6VwmmW56xx/I+NvMQlsvGkp4ShvtOJm56wmB
X-Received: by 2002:a5d:64a4:0:b0:391:2ba9:4c59 with SMTP id ffacd0b85a97d-39973af9148mr2120817f8f.43.1742384622381;
        Wed, 19 Mar 2025 04:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742384622; cv=none;
        d=google.com; s=arc-20240605;
        b=bse79EafbmKaS6fLzuhu9z2EjWli0N5IoSM3YwcOwCcSh8L/GTtlyf7c+FlqH+kyBc
         Yz1n9rxgafPQWIUcHoVjlsrg7FhjpOEEeQqRVaoUlta89HSPSltZEa85C3ajxxUqvpin
         xZLD/ea8hppm7JMGCY34yeePH36HwpEiyoas5bi0YFPV87lXDI89Oxws0vuHmB/2GjwS
         f96PQGGtEqKUTKmep31tr0KFhUGrW6FWRiGkudfjkSTW6kNe5SB6iq019ERXCBd+1piG
         oQROTudHGnYQ4dZaa0SwEPgO+p+XhJ5eQab7FmUSRGvpDpaCvCW3mochRYNEqP8Oyqcl
         t6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=L0ZwO+fCpD3t43mQctiP0uSbZ/+nn4frayCJIihuHKU=;
        fh=uByAhw2YmbZP3G8K3Gfzumcq2/EhPtWwKUhCTzHvGSk=;
        b=SxTXpfFPdxkoF1iFzfAojr37PvfzHLT0TH5fqKpq7/su3JjOkwSu55cE5toy6YpAQW
         N5f8sP0NgNVc8st80qONIN+KDcLJ2UNIhs8/Cu6JQlAQiC4/kdjYhsLV373AJGfFWL34
         siWo5/Anme/W1rcis0yh1TPphJ7dM0VUAbbM/Hv1laFn0NTBWCQYgdtsoYmY0W3CzmaE
         yW9Uygqp1CmnM9cCUpIFvY0Mdlzh5YCXvdraYI5CTjmXTTtGw5JRQ6YfCqJHYU5TLolR
         hhhRc0cyf37CSJD7yHGRA68LcbXIFjWBPg8SRNlGKYM4LU3cXd5xY3d4r/eiQ8Pi4s0u
         SgUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IlEvhUNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-395ca9677fasi12386403f8f.502.2025.03.19.04.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 04:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IlEvhUNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1turpa-0007Td-R8; Wed, 19 Mar 2025 07:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1turpR-0007St-UQ
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 07:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1turpP-0001Hh-HY
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 07:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742384597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0ZwO+fCpD3t43mQctiP0uSbZ/+nn4frayCJIihuHKU=;
 b=IlEvhUNxMZlve8C9tiPc9kGzN3qc9GpeanHAEa/r6vtdE23NK4LaN08oAS+g5us32vVYr0
 LNSl8xBwP8M12y7YvE4w8nzb1zdgBPfo7o5h1KAQwV9flyTJJ0IOBYE1Yd9lYNaxTNrBw/
 a20V5yTrvYyGv9kaz3WZz7ib3yzZM6E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-OwmizDLmORSXwQdVgA8EcA-1; Wed,
 19 Mar 2025 07:43:13 -0400
X-MC-Unique: OwmizDLmORSXwQdVgA8EcA-1
X-Mimecast-MFC-AGG-ID: OwmizDLmORSXwQdVgA8EcA_1742384592
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 230DB180025B; Wed, 19 Mar 2025 11:43:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.38])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 16BED1828A83; Wed, 19 Mar 2025 11:43:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9399E18000AF; Wed, 19 Mar 2025 12:43:06 +0100 (CET)
Date: Wed, 19 Mar 2025 12:43:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PULL 16/24] hw/uefi: add UEFI_VARS to Kconfig
Message-ID: <wugt4k6aqrrjs64ol5m5hbqhpuyivcn72duwmvf4wl3jfuufkf@nqaky6hv7bqs>
References: <20250304124815.591749-1-kraxel@redhat.com>
 <20250304124815.591749-17-kraxel@redhat.com>
 <Z9qqLUJ-1KTKyJzX@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9qqLUJ-1KTKyJzX@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sxchoj9ckr0u

On Wed, Mar 19, 2025 at 11:27:41AM +0000, Daniel P. Berrangé wrote:
> On Tue, Mar 04, 2025 at 01:48:04PM +0100, Gerd Hoffmann wrote:
> > diff --git a/hw/uefi/Kconfig b/hw/uefi/Kconfig
> > new file mode 100644
> > index 000000000000..ca6c2bc46a96
> > --- /dev/null
> > +++ b/hw/uefi/Kconfig
> > @@ -0,0 +1,3 @@
> > +config UEFI_VARS
> > +	bool
> > +        default y if X86_64 || AARCH64
> 
> RSICV64 uses UEFI too, is something extra needed before it can be
> enabled there too, as it would be desirable to introduce it on all
> UEFI targets concurrently.

Assuming riscv has a platform bus too a riscv version of patch #21
should do.  Also some work on the firmware side, but that can happen
independent from the qemu changes.

take care,
  Gerd

