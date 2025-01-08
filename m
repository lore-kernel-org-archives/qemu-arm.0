Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp851705njb;
        Wed, 8 Jan 2025 05:46:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqVSu4/YF+8qbZtVFV5/9uR9TwaMGCzdYJUx1FMVq1GCUhYl2IOI8cdDo39qqVF2SOylfSBCcxVJUxvw==@linaro.org
X-Google-Smtp-Source: AGHT+IGamTOL2aG61dwxtVFr0T+WU2ihKNpPgtKrIpI9HcurdQe/0HH5GFQRX7UBXWUjLABhU4pP
X-Received: by 2002:ac8:5acf:0:b0:467:6b64:2abb with SMTP id d75a77b69052e-46c70fd2fc8mr44499961cf.5.1736343983064;
        Wed, 08 Jan 2025 05:46:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736343983; cv=none;
        d=google.com; s=arc-20240605;
        b=h/fH0hgrdDghKXBvCPWVv0lqOvtdTge00l3IfdTKxwnNN8yYdwlZ9oxxFPdx/aagDU
         zheIYzNh1UyCwvWWKdBBgiWO1e1T5rSG6eTDuPzE9iNJJBP2OIeKR22Ntnd++1a75loL
         3XxQghogXWzZUzH5AthPzn8vnoJxckhAkm8Bbt0oP2y1kVTqCSDDh4KqQ7jdTrG7fweF
         p6aTwbz9Haz2/Qo+bXDmJldqrj3dJK/tVREwuzj9kD5WjE4Ew9zJJjBSmS1Hh09bZN0Z
         f31BPw9B7JceSoVx1yx1ThD8TXH0IFkbItFSJY24TWUTaBiVh3zVdle84neWhxTCIUAE
         wYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=+Mlk0rWicdwp6hnJVzit2mDYIkn5cm8d1vJY1QTZg6s=;
        fh=2Rz+Bu3Yn/832k3qEGFONBnZDxrM38xRAPN/Szk0NNA=;
        b=cSZZhyzlr+PXOxugdhD1E0/XqQs7P0JuRmTqsudUUw96Q1TmBJiJjWmIZ3GOQfZUoV
         FbiQBhXKUDxe7U8zfFBFghUcue9J4MJIHxaENoMx+90izm0hHlHFvMRpqDXQCMsG9pul
         TXlNsw9wpIRF1iDW1Y+FChnlGCLfWLQwNja5cbcSv9my4QBqU8vwg4ZFjggqAvocvvDf
         u5IupIHqN7zkgLQ7+UtAj408APkEmwyf8GEQaH1C+u/k7z+SHMlPAS7KW//NTjgcBf+O
         FmZOstd3O0WivWK046iouezRaIPT79CQj+S0T2b1WJLeoTbc2PArW3GyZDhKMFVufBq6
         U/dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aOTwyBbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebc0a73si389676651cf.430.2025.01.08.05.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 05:46:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aOTwyBbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVWNx-0002z7-PL; Wed, 08 Jan 2025 08:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVWNo-0002yE-RC
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 08:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVWNm-0002dh-SS
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 08:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736343960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Mlk0rWicdwp6hnJVzit2mDYIkn5cm8d1vJY1QTZg6s=;
 b=aOTwyBbA/pw6gqsaJIjV8/MloAxTr28I8NOQFY1qWzjcw7q37ZOM/D+6FPaUy4MwP/lG7/
 l45vcndlsO49qCM1NQakYTUge4bCz3ZCFxoXA0vlWFqZaRIkEDpCFKDv510ciYQ2T96Hnd
 cTwY3iMcvnR+2dpJ82dQC5qNrUeWhh8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-fndTGMvzMIKxmQZMk3N9lA-1; Wed,
 08 Jan 2025 08:45:53 -0500
X-MC-Unique: fndTGMvzMIKxmQZMk3N9lA-1
X-Mimecast-MFC-AGG-ID: fndTGMvzMIKxmQZMk3N9lA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D703319153C8; Wed,  8 Jan 2025 13:45:51 +0000 (UTC)
Received: from dobby.home.kraxel.org (unknown [10.39.192.243])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 486581956053; Wed,  8 Jan 2025 13:45:50 +0000 (UTC)
Received: by dobby.home.kraxel.org (Postfix, from userid 1000)
 id A43C62CDE47; Wed, 08 Jan 2025 14:45:47 +0100 (CET)
Date: Wed, 8 Jan 2025 14:45:47 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 qemu-devel@nongnu.org, graf@amazon.com, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 00/21] hw/uefi: add uefi variable service
Message-ID: <f74vd4sabo4ndrlq6jm7xish5wzgkh4lqksqdi6s6pv43acagt@wl74akpl237h>
References: <20250107153353.1144978-1-kraxel@redhat.com>
 <CAMxuvazrd+3v2qqO-5o3qpky-ULRTwvU48jkwdxMPZG5c1RA1A@mail.gmail.com>
 <Z35ulWfiCNq-cd3Y@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z35ulWfiCNq-cd3Y@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.432,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xM6nSb5jNawW

  Hi,

> > Typically the kind of new code that I wish would be in Rust. But I
> > suppose it is too early yet, and you came to the same conclusion.
> > Probably a good candidate for rewrite though!
> 
> Perhaps too early for the device impl, but I would have thought
> the general var-service code could be done in rust today. It does
> not have all that much interaction with other parts of the QEMU
> codebase & thus wouldn't be building on the moving target of the
> QOM/Device abstractions. It would also be the prime part that
> could be shared with coconut-svsm too.

That remains to be seen.  The svsm code will indeed most likely be
written in rust.  There are a number of noteworthy differences though:

 * It's a totally different environment (no_std).
 * Persistent storage for the vars will be different.
 * Crypto code will be different (probably openssl because the vTPM
   needs that too, possibly native rust crypto).

So not fully sure the code sharing part will actually work out ...

I plan to keep this in mind when designing the svsm code though, and
then revisit things once I have some actual rust code for this and the
rust support in qemu is more mature.

take care,
  Gerd

