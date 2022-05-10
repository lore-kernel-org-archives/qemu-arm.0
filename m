Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp4200202lfj;
        Tue, 10 May 2022 01:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6MYiHIg//q3U8YC/coP9vvHvHg1zlvl36x0o9u1rAFenDJwTttua5OI8cq2rhLbV3jAzz
X-Received: by 2002:a05:620a:1928:b0:6a0:497a:9b2c with SMTP id bj40-20020a05620a192800b006a0497a9b2cmr13463697qkb.47.1652173002329;
        Tue, 10 May 2022 01:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652173002; cv=none;
        d=google.com; s=arc-20160816;
        b=H5/LrAWJiQhPTujSlYuZ8LUzp+f8vknclepa/dp2bRzpd6HJ/jrbzgPuvApSBBEF8X
         50CO9JOcTqAR+WEIkj9cqd3WGlpuKnUBIaP+ua9p4dJl765e/BNfj2/Ad5oi2fSD1/2o
         aeAq+hSzz9/vqJ3WaO0dlYw/+gsNjVbARYe/1QNj2Pnhap4PArNU9OUGgA6qvuNwkAyf
         ZVZuFCaPUgQVZwnW5jK3m0pG0jLjebpKCQ1z7DUPCrFxoCPqtn9lsPEMc5tFG6q98qX5
         Mr/fBpanE4VNkGSg1NefqyazZBEl14U8wuw/LumXM7+G8ilS6l73LCoCh4CMOjSd9Kbr
         b0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=BJCJEF0/nkIb4XMZuyg31UyMc5KKCwYihAEZrHqPDvE=;
        b=RFJCzJ/G0XvS34NodeBluU+eD5J3WzIyBBpmLyo5Tj9FOXs8O2Lhud0pfz6cK+r0OD
         jKY4ixGB9CjshMNvimTJ2BH3OhsOxOTpSz0NoIwFauecNh7QwV9KAPAZbNIYOdfIzjP/
         pANLKGvec7bD6b5/RpOwd74SKB1rjUkCGgGqijF4+jYFZeEXQlczzmwwcHsmcZYf6RiO
         Mm01vrFaKGHDTBuxq0aCJbnIHWFoeyDWqXE/sKcV5wC79wVvF4MofkHbOZOMVDjN1V1b
         za/WhLaUhX26WTuV9SJ3nEJTyly5XxahFV5Yktvj4YutloIaxoNf/8NHcOJhYjT550tp
         cegA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bmZFECF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d193-20020a3768ca000000b0069fd1059f05si8493839qkc.517.2022.05.10.01.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 01:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bmZFECF8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noLfd-0007MH-Or
	for alex.bennee@linaro.org; Tue, 10 May 2022 04:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noLdA-0006i1-CE
 for qemu-arm@nongnu.org; Tue, 10 May 2022 04:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noLd8-0003Tw-Sv
 for qemu-arm@nongnu.org; Tue, 10 May 2022 04:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652172846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJCJEF0/nkIb4XMZuyg31UyMc5KKCwYihAEZrHqPDvE=;
 b=bmZFECF88k5IqFsFdJXLa8E5xt/1CVFPT+yQB8eOfq5EGZkPtRELgA4ZkpHA2eoHBf7noC
 LaFCGSWYR+nwHRz/USTSHAKkobRAG6vAuJn2ZbLzt2xbyONFJg+v8RRksgZkuQLL73WmAq
 ZkfJUUmxagWZTEvzYrn5SlVxMsG11kU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-Q4CGZORLP3-tnVjtHTOBXg-1; Tue, 10 May 2022 04:54:03 -0400
X-MC-Unique: Q4CGZORLP3-tnVjtHTOBXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F0473C138AB;
 Tue, 10 May 2022 08:54:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 772C7463E02;
 Tue, 10 May 2022 08:54:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51FCA21E6880; Tue, 10 May 2022 10:54:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Fabiano Rosas
 <farosas@linux.ibm.com>,  muriloo@linux.ibm.com,  qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  mopsfelder@gmail.com,  qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  qemu-arm
 <qemu-arm@nongnu.org>, qemu-RISC-V <qemu-riscv@nongnu.org>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
Date: Tue, 10 May 2022 10:54:01 +0200
In-Reply-To: <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com> (Thomas Huth's
 message of "Tue, 10 May 2022 10:03:35 +0200")
Message-ID: <877d6tzs2e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWZLFDQnyKXc

Thomas Huth <thuth@redhat.com> writes:

[...]

> I once suggested in the past already that we should maybe get rid of
> the 32-bit variants in case the 64-bit variant is a full superset, so
> we can save compile- and test times (which is quite a bit for QEMU),
> but I've been told that the 32-bit variants are mostly still required
> for supporting KVM on 32-bit host machines.

Do we still care for 32-bit host machines?

[...]

