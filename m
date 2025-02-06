Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1574400njb;
        Thu, 6 Feb 2025 06:32:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5PuV2JaPJXVyt+j/cJtbYnJAp9OcBgG4SjHdrZJNB4q7+kAnSaBayTKb4IoeK1D2hih12068cH7hfCA==@linaro.org
X-Google-Smtp-Source: AGHT+IFuDeY/+5BhrRcOWlXYzmYsqiQQGh5ROicacXp4XshV7j1L4u9BfsTMUDkHtxyN9gAmcqiA
X-Received: by 2002:a05:6102:1629:b0:4b2:4950:16fe with SMTP id ada2fe7eead31-4ba47997ab5mr3818048137.14.1738852328110;
        Thu, 06 Feb 2025 06:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738852328; cv=none;
        d=google.com; s=arc-20240605;
        b=cnwz99b/qsCZMom61tDY7kkeUZmMQ6+d5D2HEVE2urozkNitVAsOtit488pl7DtHx5
         7LzRDjEsHtR3Lwc4RO+jH15/ilMxBctQMB/Z/2nUt5+T/CrdpWh1twnGyakXDdUEAB24
         nTn7cJIp33JDaFAOpX3OvajxCytxpEFogivqh37EGsZwjKqAErQWjuIqg2HZIsDDtA/p
         UaiE9z0Ha/Cx2HUfvubkHFIg3MLTajDf9lfhpRbb/t3dAJAlHt25UBM04K6/K/6oggXp
         VYDFu/Nji7IS3FhD0JO8Rz7xT3fDyZLu19tyb50Ak/KzDaYpqACIlk29KjeS+nRTrsPP
         o7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NUn8fm+GX6XtBZaHJoDnuBMOfBEjUR6YRXk17snVc3M=;
        fh=yWPD0YbbnW4+pviCR+H2tmsxQpcDikULoNtB9bLqxoo=;
        b=MAX5n/wDGN7ZMT2yQkY7bpM0gvo9kbZWWRzvNGGHHKnvehvNJSwBnYcpWXZEw/lK9b
         HGeTbWF8+hqKjP/Nd9+a0Jl+Y0Z/qz948NypAGPNa8r/uzpj+dEn3yThHrV7tHyUhqwW
         Ns2j6zOVs5TYwdacxlZEwTBW0M3N6jUSXwsBtBU/1dYqy3ZVvimALGEBX6dLRc6BNqCd
         tnMh3L77zG2QztatmLqLwnbY6uzgLuw4nMbL9Y7GY8NUzxPx+HOdaUo9a+Dk1YqCuvIP
         Djiu2SWIuCEB+BafaK7bTQlyiqhjk8lekJtAEvslSL4qRbHh3S+TxHgfeAsgXIpa9+cD
         YRDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iEhNqEvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba7765a513si208036137.26.2025.02.06.06.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 06:32:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iEhNqEvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg2ut-0008JU-Co; Thu, 06 Feb 2025 09:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tg2up-0008Hm-Uy
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tg2uo-0000YZ-5h
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 09:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738852296;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUn8fm+GX6XtBZaHJoDnuBMOfBEjUR6YRXk17snVc3M=;
 b=iEhNqEvHVac2IY7of1ngjI6Mb8AN/ZUBt0jS9fLqbENGKhjBRASoC1nWR7v79s2vPyHVgE
 8/RdmZs5XugXeQlCk65aGMnxqqHNG+TOaOr/Wz3snBbnA+g3ZRzm/7x2dOf0dBJL6oidBD
 SFcqDXMsVqPjEpMBhfNjLrSnEeIxeUA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-J6dGRMjJPf-VkBJ3ilb60Q-1; Thu,
 06 Feb 2025 09:31:32 -0500
X-MC-Unique: J6dGRMjJPf-VkBJ3ilb60Q-1
X-Mimecast-MFC-AGG-ID: J6dGRMjJPf-VkBJ3ilb60Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 390431956086; Thu,  6 Feb 2025 14:31:25 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.33])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19F1F19560AB; Thu,  6 Feb 2025 14:31:20 +0000 (UTC)
Date: Thu, 6 Feb 2025 14:31:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
Message-ID: <Z6THtfjL6UVhBiW7@redhat.com>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org>
 <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kmj1sM/wN6Ij

On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> On 6/2/25 14:20, Daniel P. Berrangé wrote:
> > On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
> > > Introduce an abstract machine parent class which defines
> > > the 'little_endian' property. Duplicate the current machine,
> > > which endian is tied to the binary endianness, to one big
> > > endian and a little endian machine; updating the machine
> > > description. Keep the current default machine for each binary.
> > > 
> > > 'petalogix-s3adsp1800' machine is aliased as:
> > > - 'petalogix-s3adsp1800-be' on big-endian binary,
> > > - 'petalogix-s3adsp1800-le' on little-endian one.
> > 
> > Does it makes sense to expose these as different machine types ?
> > 
> > If all the HW is identical in both cases, it feels like the
> > endianness could just be a bool property of the machine type,
> > rather than a new machine type.
> 
> Our test suites expect "qemu-system-foo -M bar" to work out of
> the box, we can not have non-default properties.
> 
> (This is related to the raspberry pi discussion in
> https://lore.kernel.org/qemu-devel/20250204002240.97830-1-philmd@linaro.org/).
> 
> My plan is to deprecate 'petalogix-s3adsp1800', so once we
> remove it we can merge both qemu-system-microblaze and
> qemu-system-microblazeel into a single binary.
> 
> If you don't want to add more machines, what should be the
> endianness of the 'petalogix-s3adsp1800' machine in a binary
> with no particular endianness? Either we add for explicit
> endianness (fixing test suites) or we add one machine for
> each endianness; I fail to see other options not too
> confusing for our users.

We would pick an arbitrary endianness of our choosing
I guess. How does this work in physical machines ? Is
the choice of endianess a firmware setting, or a choice
by the vendor when manufacturing in some way ?

Picking an arbitrary endianess is compatible with our
test suite, it just has the implication that we would
only end up testing the machine in a single endianness
configuration.

If we wanted to test both endianness options, the test
would need amending to know to try both values of the
endian property on the machine.

> This approach is the same I took to merge MIPS*, SH4* and
> Xtensa* machines in endianness-agnostic binaries.

If we have prior art like this, then remaining consistentv is
desirable and thus my comments are too late.

> Also the same I'm using to merge 32/64-bit targets into the
> same binaries.
> Assuming we have a qemu-system-x86 binary able to run i386 and
> x86_64 machines, what do you expect when starting '-M pc'? How
> to not confuse users wanting to run FreeDOS in 32-bit mode?
> 
> Again, IMO having '-M pc,mode=32' is simpler, but that breaks
> the test suites assumptions than machines can start with no
> default values (see QOM introspection tests for example).

With x86 there's no need for mode=32. Whether the machine
supports 64-bit or not is a property of the CPU model
chosen. eg  "qemu -M pc -cpu Nehalem" would be 64-bit and
"qemu -M pc -cpu pentium" would be 32-bit.

The qemu-system-i386 binary is pretty much pointless as a
separate thing. Libvirt will happily use qemu-system-x86_64
to run 32-bit guests, by just specifying a 32-bit CPU
model


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

