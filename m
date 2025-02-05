Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp93017dlb;
        Tue, 4 Feb 2025 23:04:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtMVwqsi1XWDlN8sedFHadxv4AFv9kgalnp+7nrmgEHpiYcg8Ok9M2wqmq283CpQX4htELpDEkeQeikw==@linaro.org
X-Google-Smtp-Source: AGHT+IGvJ6dpShWF1l3RHEwXzmeicnvBHOUCp8HDFbFGdqmjMn6ZDC/5B4vO+peK9bh++wJgyi7j
X-Received: by 2002:a05:622a:14ce:b0:467:6f59:e343 with SMTP id d75a77b69052e-470281ba558mr22775511cf.21.1738739055168;
        Tue, 04 Feb 2025 23:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738739055; cv=none;
        d=google.com; s=arc-20240605;
        b=Zl1M2H7F0m66oKpZ3hnr/aV3nG+nitZUHYKtaUR4sytB7qch5+Ex1PgLX9/fzUJP1R
         Q6R4HijR+gn4BakFwBTqe8bBTDnC+hbThcr37DfW5tcqU8Jbgf2ZcHSFXC1gwTVRMFXt
         PTao7c06w3R3rzx0nRjqxIDE1A5/tdoincnmKzyCIbODGY2CF5nX11s6toXx9qBSvHJg
         RjvbHvh6FZajFCmkE7LT+pCRzWtdCW1lj21ktZUxVwEA2oqDqYi3MOdPNlP6Et4zRzmq
         hvE6QqrALKT2gPEHBMvOCGm2xNT+KMtP2jI81sBEsOHGRVUIggMGpXeW7XjRf/t8iOFM
         Bl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=PeKzNCbqDHX5T2qs5ymRJlvRDQ8IU5pfqJoGl2ABSfo=;
        fh=sfQD0W4tX7XL8vokq0pEQCGulX9l5JXG+4nX/UG3lAA=;
        b=Umymg252416WADNS1/yoPqTzktp4evhfT7QC0ot/u4TZrn307clKp2eWgILTq5GkjS
         poTztZ/rMlIwSuJtyQnSINimPzCyE1TOsFbXJqzM7GPQgZAahJyO5UCFNy3o1csPjrgG
         krsVfQk58Q83S2befSlom5Aqo3crOc+h0dwrijsTx+uBNoBjhhLbDccUIHMgdi03Oz4u
         2DvvZe9X5eyzBPyn+3nYnyQoVFKUfHuEfjuv9GU5thBa1hfAG7UL4yz1gQjXi/8G1KaY
         0DNjqMwY4ZAtIYkTmdmif9A477E01exlgOxNECFguGo+JYF8JL3aK2cNgydco57H34f9
         O6rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5DrlCIR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bf2e9esi45993201cf.589.2025.02.04.23.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 23:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5DrlCIR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfZRW-0001Sm-Gw; Wed, 05 Feb 2025 02:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tfZRS-0001RD-Dk
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 02:03:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tfZRR-0004ah-15
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 02:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738738999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeKzNCbqDHX5T2qs5ymRJlvRDQ8IU5pfqJoGl2ABSfo=;
 b=N5DrlCIRpibhJeUaEImnpcrUxQvVnzRemc7Hh+giZWKXiKGw3JNjZ8bSGGv4qgGCWLfnB2
 mUc4ODzsDuUuL2c4jwjIBUn2uTUoSaHqwlH/+MEM9pRIriRKB8QYZbEC/1Z2n+sxRYwPR0
 RUOBKDqq1/zAeLpCqCY6is2XPV30qLk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-NxnVGc7IMQ-OvdGzLLlYjw-1; Wed,
 05 Feb 2025 02:03:18 -0500
X-MC-Unique: NxnVGc7IMQ-OvdGzLLlYjw-1
X-Mimecast-MFC-AGG-ID: NxnVGc7IMQ-OvdGzLLlYjw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E24DA1800875; Wed,  5 Feb 2025 07:03:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.40])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3D45B180056F; Wed,  5 Feb 2025 07:03:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF4D921E6A28; Wed, 05 Feb 2025 08:03:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,  qemu-ppc@nongnu.org,  Daniel P
 . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
In-Reply-To: <20250204180746.58357-5-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 4 Feb 2025 19:07:42
 +0100")
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org>
Date: Wed, 05 Feb 2025 08:03:10 +0100
Message-ID: <87a5b07u1d.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K5gMLOhOHolf

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> MachineClass::auto_create_sdcard is only useful to automatically
> create a SD card, attach a IF_SD block drive to it and plug the
> card onto a SD bus. Only the ARM and RISCV targets use such
> feature:
>
>  $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>  hw/arm
>  hw/riscv
>  $
>
> Remove all other uses.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Impact?

As far as I can tell, this stops creation of the if=3Dsd default drive
these machines don't actually use.  Correct?

