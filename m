Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2424064ejo;
        Mon, 8 Jan 2024 09:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZuSWjo55n7c4cW+7ibnMil7LDwk3ngQOZ5UppH4ZXkdbBKQmlQJG8qb0IdQGIznb7YJB+
X-Received: by 2002:ac8:5856:0:b0:429:916f:92d1 with SMTP id h22-20020ac85856000000b00429916f92d1mr3619491qth.6.1704735515638;
        Mon, 08 Jan 2024 09:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704735515; cv=none;
        d=google.com; s=arc-20160816;
        b=Ss+Qr/QRATpR5Ys7VI2qTSGiPDS5YGry8+WjfePJah3oFf2qXWy1G8cpdM+GiNd7FK
         qTYlDJ9EB+rHSztTzGXN0Lb5v0WzJf9j9Ar7chpfccop49NnqsUL3Dz6oPVticb1fWrM
         w9gen4cj8Cu2xqnTqc/1DFRv5pkKMj/C6npPrmKO6rqfWNzJ2dam91GA2s8BYl23nSez
         xAGbPEu6hB5xev0Y/Uwj+BfOE+RnZMnooHQbK5gZhF4Q3k1zDqvdIO1u41VSdWmrT1tK
         Kn+svJhhKx+YDgp19fMnYFlXsx05l4StZ8MU1ak2IwMOer7fQLZievXFzM1jNk3JgrBL
         eqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        fh=5paFcOb6VtZ2h8h7wMYzjY1Ui0fNIPG4iWumKjpOUaA=;
        b=fG1JifmFPwdZvJdvNcXoRVuvBiEiHhhT4bb87MnPNbzweZEx/J4mQpPj0HEQ3sEb+h
         LC2L6GyvugczEg3ygjJSgu2QwQP3mWs65BMlw+5dgRJAsyPuOb0wm2hUZwEDcIpwkrGo
         Ez8KCWbbY9G860CThuZ6FFOPX9dz3vf1NPBRlTSKcF1BEt6bMZ8/LLYYhJYUgLPlaWy+
         464nERzKLnpe95G1HLo0e4vc4ZkWIJcrkd4Ha1/5Xrn77MfcDmrT0eqoyVZY5nEUt92+
         BMZJYM49WkYARxTbcChW/9Tfv7xWytoFbvR9e73d5rVeIO5XPTKn4W6+fQItQP+glFpb
         deZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3qpg7Ns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05622a138900b004239fd7fc33si167124qtk.751.2024.01.08.09.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 09:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3qpg7Ns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMtZc-0005ow-UI; Mon, 08 Jan 2024 12:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rMtZa-0005n6-AO
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 12:38:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rMtZT-0002sd-Fj
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 12:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704735473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=N3qpg7NsyR+1V2Np5gY1YKhea25QFPqvB9eFjJns0aUF1BrImBqQPyJJdRefUQ5Z6sWcxN
 NfKUe7Zb7bioP+hsuWFPt/ZmcXPipmmSzRPcinA3l34l7TPK/l7zGjZ81QCz5N6zZsczaO
 K65Gv9NtE05kmhhd1oNZo6RfK9Ev8mk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-iEsuidouNrG2YJlpOkLRgA-1; Mon, 08 Jan 2024 12:37:52 -0500
X-MC-Unique: iEsuidouNrG2YJlpOkLRgA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33689c90957so1501537f8f.2
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 09:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704735471; x=1705340271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=nHJDOCHKmYA0ejqS2ae2b10nU//sOFE7R7qIjseaPdJ5EjVR5dPJS5avuwIyadc+6M
 McAbjUXgwPq7p9npYZuL4PiFIRoNiEIl+olfmpcsVncASZ+e7mj0H/7rAXVR2X3p2N/K
 sYVyCIDoUkeqho39pxhck7BgMA89N2owIqrteg0pjzTFV1MUn2SLivh5fI5WL7tnehbL
 zSeJbzPcJJWcpkUWDng4u6FXq7YrWuUGYzyds693s5y9wtUjmNTbx6LmbPzHIItG9/Kj
 LE1kr5rraLtZZGdU3TZos6qTNAW/HLpDjrzmnlG75UUKO49noYMUm79fWpsc0i986wNi
 XGkA==
X-Gm-Message-State: AOJu0YzDyhzZhZRmZh2VTUOicsFNCiTD9c3RZee9OFrfdLBJ4XAO1agF
 ulFmiTFavgBLWOGPfahBVYM2AbcUSaiJ8rG4lM+Kf2gttFYByi/0DV1MaxNvmp8Ac2KJHKM6+b9
 pbUPeNxzQz8I1fK6ZIIvJ
X-Received: by 2002:adf:cb92:0:b0:336:8143:9365 with SMTP id
 q18-20020adfcb92000000b0033681439365mr1483262wrh.130.1704735471215; 
 Mon, 08 Jan 2024 09:37:51 -0800 (PST)
X-Received: by 2002:adf:cb92:0:b0:336:8143:9365 with SMTP id
 q18-20020adfcb92000000b0033681439365mr1483258wrh.130.1704735470872; 
 Mon, 08 Jan 2024 09:37:50 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d6384000000b0033760ad2eabsm188054wru.69.2024.01.08.09.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 09:37:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg: Don't #include <inttypes.h> in
 aarch64/system/vtimer.c
Date: Mon,  8 Jan 2024 18:37:48 +0100
Message-ID: <20240108173748.162393-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108125030.58569-1-iii@linux.ibm.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, TVD_SPACE_RATIO=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RGGkOiuQD8SV

Queued, thanks.

Paolo

