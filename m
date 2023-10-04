Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2649430ejb;
        Wed, 4 Oct 2023 06:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCAnUD7NOoYUde2gU5+rh9K6EdMz0zUhC88Eq1D0qgvGsKJSsksUYsArSUEJrMmGuFyx2a
X-Received: by 2002:a1f:d6c4:0:b0:49a:f735:33c5 with SMTP id n187-20020a1fd6c4000000b0049af73533c5mr1916973vkg.15.1696425659777;
        Wed, 04 Oct 2023 06:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696425659; cv=none;
        d=google.com; s=arc-20160816;
        b=i0+2sLAK9DShFIgZhGvPnDYSpizjdZ2NTg9Jh1kc1gb1MgsiHeOopl56VMAD3Ah8tw
         ExtjCVwwiGL3n4Di9lxbm9t+2ql9koktJ2LoTgD0DKlUDB3aSi0hEG5MC6hMxa5+fbxW
         0ZC1l5d5Po/ygXfNJdiaBHlCoUp//kQH5xPhNzSQRDGzrKe27FWig81QH/76j+ip/qMp
         wwGKxf9xmPLfVGDL1+G+ltWK6e561Lz9A/CokKbAgBXjLYGPa/9Hq/EdchOoUtHzu6ZS
         UUdLII2vutDupMRXVNuqiGVvMBCciAFVESzjtu7vcqWTZGk4lJt3JZmU0yA56N9xi6wV
         pj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        fh=dGIpd4UFpGJRv2Dmy1xFLSxF6FDki9+ejz1quR3xOrQ=;
        b=NA/pQKsbcHZuO+jC5DLRBN0csgrRUoxCo0L9cqti8nApjLB7sw8uDlKmjWFAUFRkud
         +sHFAln/BIEh4wYp0cHk5BvvTBeyQoHtgN9ai/nXGeHUTBt0Qu9SX92KjqBIie7B8UUe
         NOuOnhUC1RdjU3uNPGq0P/1Oox8nrs7HUutHIkefxRqkKsD4KZEeKnBaQeYGjSO/u/HG
         tFUDteB3fqfPQuv1Xz4E5KYPD3FsfFf0R/+1e8xeS1DcO4sqd5wCMx7w+pv0YYgk14my
         erQchnoYudiy7hVc4akYTZ+omeAbdcZ99aLaFSWFBo+4iLCTdG/HGknUkaGoTBV5ELcQ
         H3JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKLK9av3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020ac85910000000b003fe296f07casi1451422qty.302.2023.10.04.06.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 06:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NKLK9av3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo1nw-0003qm-Ct; Wed, 04 Oct 2023 09:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qo1nv-0003o6-0Y
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 09:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qo1nk-000683-MR
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 09:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696425631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=NKLK9av3W8YKouGhGtXlImoE12rxxM4tWgOET4iMUCwJiERIIpoTkh41kjJ/e5BYVLzSI6
 82Es96wRVgaK7d8fOIzkbG/SEdu0JqJAMUaEivNZP9CdkfIgyFm1m6UVD+mMxx2IwJn4gK
 i1Ly0EIJQPDP52dcdJHgjR2Nwf9eNfY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-eWDhv8ZJPSWnnnKrAUrFcA-1; Wed, 04 Oct 2023 09:20:20 -0400
X-MC-Unique: eWDhv8ZJPSWnnnKrAUrFcA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9b2c1159b0aso185251166b.3
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 06:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696425619; x=1697030419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Mk/lDm2H5GtP/2jJo1aYcs4Ee+jXd6lQOEzi+36HcmYV7mKpGqiSdvPAqzb2Yvk4KG
 lcQ/e5729oKtlvYm9YENqT2SPnvLXKCdwgPYpW6v5pl51y2895e+f6aAVXAPuSLxIpKF
 4kFm3rRVUAnZKsknqBDKKPnaodyeZGw8XCm2yBTDEOJR9idHw5BIG6c/tWYaZ/E6k1ob
 kHb6j5I07O/fvWd8sFQLqcmQjSRGLAdPFBqgMRZCZ2QfdJgqGLimmlaKRPKCy1S2qtdJ
 9YIDY6BUcSg4Ozph6p/FUzpWO+EyHBDL1z410CW7OzJ3S6bs4wyRMUX7ceF3+2K/prgN
 b6dw==
X-Gm-Message-State: AOJu0YywRNQNY3ahoUyJc66cy/LdNHbvOk8ERw81YrUaQ/REZaM/1+70
 IfTpSoGHOygD2k+pnmQZcWBdbLYQJ/wClBDXRcDZzYdm/YF7UbfHsREcYOHvG9lxNbw6m6rmc1J
 Sl+oP96fpVCYg
X-Received: by 2002:a17:907:6c14:b0:9ae:588e:142 with SMTP id
 rl20-20020a1709076c1400b009ae588e0142mr1874252ejc.67.1696425619665; 
 Wed, 04 Oct 2023 06:20:19 -0700 (PDT)
X-Received: by 2002:a17:907:6c14:b0:9ae:588e:142 with SMTP id
 rl20-20020a1709076c1400b009ae588e0142mr1874229ejc.67.1696425619330; 
 Wed, 04 Oct 2023 06:20:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 um14-20020a170906cf8e00b0099297782aa9sm2778308ejb.49.2023.10.04.06.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 06:20:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Date: Wed,  4 Oct 2023 15:20:17 +0200
Message-ID: <20231004132017.160874-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fZwgrEhJR2LR

Queued, thanks.

Paolo

