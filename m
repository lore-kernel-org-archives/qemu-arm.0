Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3053799lfb;
        Mon, 18 May 2020 06:48:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaGRb/yM9WpCWwHyF5v7StFRGeBObTNprxoGoxn2H/lMXLh0P0tXZonBVhSnBu9JNNcuTn
X-Received: by 2002:a05:620a:2110:: with SMTP id l16mr15653407qkl.106.1589809736387;
        Mon, 18 May 2020 06:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589809736; cv=none;
        d=google.com; s=arc-20160816;
        b=AFi2EAT+YvhhJKWtjKJFZhvjBHqVAsuqapjSuidb8Bs7Eq9XsvoYuWwRpSnV5GDWx7
         vA7KlUWKNDklUOaJgyntp9j9Em1Cpf7Fk8y9+GG1rl7ejiIfUxRAVs9PtmaWCPcKAnXh
         wFmga7ln1gzcP/yRhTpjaMh3locX9vyrDLCmPtOvhMuTNBnUqCHOzQ8XvyDA1CDok2So
         Zf2C+vQ/8pbLQYNL5XmZ7rWM70xsgONPGWRlDj/1KKXRph8mbrwq25yIPjFnBue/RsZN
         SuN1vicoka60WNHts6FuN4M1UyIGgAJR3LqZtlpX9zxg+XorSC5SHQUNBKcQVN+5oCJZ
         IfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Y3OlCCcmN3yKxtXoXkE9faXpXp5VefJvkXruV42Ylns=;
        b=JIG5ISQX+7GkowbOSbNY/M4sD7wMlieQKGj9+1X8X3s0PVDqqm69nMB7se8TbCjFCq
         CGriHEaJAtUKq0VmOsGNzvtwSlIqMrRhRygMOgq990TOHQvMQjz7DZPVJ7nh0KFQgGZp
         WxinuSvOkcmVJGcLrxNXFu6fqf2hyRgBNYd2k7K3Kyw3foIZGm4blHHjSVH/r7Eo9qXN
         cn/RNraurfp+0nx5CPGFFCDf2n3Q4vCmw0dvZUhWsO3pB4FaklqZ+IkHGn79ptyqCcZG
         1tJEkE/17oQ5LtYV9c4mRsYViu+8z4kLweBd2umVuniqkgEH/EJ8uI7p4H+9gJE6LCtu
         TEGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qk5idGin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si5399442qka.110.2020.05.18.06.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 06:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qk5idGin;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jag8V-0005xu-SM
	for alex.bennee@linaro.org; Mon, 18 May 2020 09:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jag6u-0004SG-LE
 for qemu-devel@nongnu.org; Mon, 18 May 2020 09:47:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31509
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jag6t-0006bV-JT
 for qemu-devel@nongnu.org; Mon, 18 May 2020 09:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589809633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3OlCCcmN3yKxtXoXkE9faXpXp5VefJvkXruV42Ylns=;
 b=Qk5idGindLHkmSuA+pOxjiCuEYb3xuWOk4UJ4BxCBXCtOVzqgfUdXG8uLVFuvgYny7xA11
 TDLKeYYS7Akfl9PjqzUZdae6sRcXirc27jyTZOhCwbU+BvWnVi2ynCYU4Ye8xdKyQQ4hbc
 t3FoTWa3DBFaE+ZIPK2/pMY24MqC5sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-0iz6maMqPweSXeUvEcUmqQ-1; Mon, 18 May 2020 09:47:12 -0400
X-MC-Unique: 0iz6maMqPweSXeUvEcUmqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF5D28018A6;
 Mon, 18 May 2020 13:47:09 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-96.ams2.redhat.com [10.36.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C17E5C1B2;
 Mon, 18 May 2020 13:47:00 +0000 (UTC)
Date: Mon, 18 May 2020 15:46:58 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw: Use QEMU_IS_ALIGNED() on parallel flash block size
Message-ID: <20200518134658.GC11295@linux.fritz.box>
References: <20200511205246.24621-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200511205246.24621-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1OKk8lLSrxCQ

Am 11.05.2020 um 22:52 hat Philippe Mathieu-Daudé geschrieben:
> Use the QEMU_IS_ALIGNED() macro to verify the flash block size
> is properly aligned. It is quicker to process when reviewing.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks, applied to the block branch.

Kevin

