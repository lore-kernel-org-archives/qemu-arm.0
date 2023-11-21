Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp534382ejy;
        Tue, 21 Nov 2023 07:04:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMZKrW7g/0TdQefXYR2Pf1Qr7aRr2lsQu941kf8cFWTbqMsN9I02wq6UaykLVwH+uCUWX6
X-Received: by 2002:ac8:5f09:0:b0:418:11ee:6315 with SMTP id x9-20020ac85f09000000b0041811ee6315mr12749303qta.43.1700579083733;
        Tue, 21 Nov 2023 07:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700579083; cv=none;
        d=google.com; s=arc-20160816;
        b=yC1Sgt14FUEI8i+Gg+yy2bKtmsQ4Z2ljdMHXcRd5kxMqvo/DAnbV0oDRim2hTZLyFt
         WfOcrcHQlNytjIGv4SYRPdsO9UUrUSB/h2GosJ1j1oHZHaue2i7AfLUvOhPN7fgMMHa2
         yW94aJ31cT4FU0GvMxam60W7QcQuLhvicEH3Pj0YyzLp4rKaOdcKyVZB08pQ2nTyn8bX
         t0aYdwhlfU5F5jH64ZwvuWwRxzMzEdfTlLYWt/RPgeptFPzSgB+/aPAc+AmvK8gouF6N
         CB3JK/Qh10jmWBjbu33JSe3eGtKnrx9qfraqe6gZ/nx4YiwxEYHAapD9k7hnYeCPGYXg
         vtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=PbYUpQnSAHn8bTxYEUq4d8Seyw6g/VBkK0Nbfpj6/8w=;
        fh=CsdiWNFHKpDi85bv+LYNHOHQERFxFhU1c1y9HbqB3eA=;
        b=Kjz2p15mDisDAVrnmnD81EmH3/sWL2oCekCo79PjmbyEA9n3hJX4nR+mWJIA+Jao5M
         Di6+ZjtulcHv88tbKKaf2Z1wW4WGbqZoIEiXNvrRHsDG18HO4b6SFNOuvVdHUG5oXUFn
         5af39htKwgdEkL7tbib45mqSvLQ7tJS0NEhG/3O1xWjKfcAkofPr3zKwhsS1lnVylyWg
         KysPxo2OX7ktKn9QswrSomjxHtu2lOkQw/4QF0Ch6dTjofWd0TctfwMCIgyaVCgpxl90
         bQB79AK8nV3xIJh5k7ANwyqD63rnhl6QexK9LLkp5f74E1jaQJCqPCguv55WC8i+MCWe
         tOqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aHTay7mj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16-20020ac84e50000000b00403ea9c5354si9199198qtw.435.2023.11.21.07.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 07:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aHTay7mj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5SIa-0002Ay-C1; Tue, 21 Nov 2023 10:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SIZ-00028b-Ib
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 10:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SIX-0005YL-Ml
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 10:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700579061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbYUpQnSAHn8bTxYEUq4d8Seyw6g/VBkK0Nbfpj6/8w=;
 b=aHTay7mjtCRQ2kGYaSXLzsBYDZ8SpPibVYgep5cIwEvfZavtKXzlGm/OrAtTh7MKPZ03JX
 +QTikb5ajeljtSGQa9IpRZ4kT/iRlwXGZc7R2ku9wzuBvKtEEuupcLssddDTkcRCeJZXHh
 7Itv9H4Bn9KbbzJb7QVLZoONsAoowYY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-R0D14BaWP9ubiJJ_EfykXg-1; Tue, 21 Nov 2023 10:04:18 -0500
X-MC-Unique: R0D14BaWP9ubiJJ_EfykXg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6755f01ca7dso15083006d6.1
 for <qemu-devel@nongnu.org>; Tue, 21 Nov 2023 07:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700579058; x=1701183858;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PbYUpQnSAHn8bTxYEUq4d8Seyw6g/VBkK0Nbfpj6/8w=;
 b=YQf+CMPpe9GBrSRoQsl26L+pbBAFsRAxJPtOYSx0Oj+2R9uPmjJ/deFfCwYTF8e4C0
 egpsKqHlp3zfC+4aArhJU4RlXS1k/c8onRfSc6Eh/+rcVN9HH5CzM6R5eIJckyjYGeGK
 cA7wrX3MdgPy1ZUz2eBtS592o4yritplHQIj1hYaen8TO3YlziQHGld43Uiggx7P5pG2
 i2D4yasoEq+hDYg/H/0gKkDHnjsVt8v38QmqfWGCpQWeMJmD5x+C8h0BRxByn1ES+Tb9
 PPh38Rcfoy06t5NSIopCwvj2f86OmpPHIc70PekAz5ei4vUg9DfN2Z6bPuvbxJuebHLF
 c2CA==
X-Gm-Message-State: AOJu0YxVzkAk7VxbxEzmDz39uE+8oh3PCu5AOVAN4OxovkCNHkx2TD7c
 mh9ctATPLOJKghURknJXZV9JYVyOZObZHswwrt8R+gs/EmCTXOR3yFP5KRD/YmqhAoqHPhTKLjH
 BQ0HTgPpizQ7sHsE=
X-Received: by 2002:a0c:eb44:0:b0:66d:264c:450f with SMTP id
 c4-20020a0ceb44000000b0066d264c450fmr10550152qvq.0.1700579057975; 
 Tue, 21 Nov 2023 07:04:17 -0800 (PST)
X-Received: by 2002:a0c:eb44:0:b0:66d:264c:450f with SMTP id
 c4-20020a0ceb44000000b0066d264c450fmr10550128qvq.0.1700579057685; 
 Tue, 21 Nov 2023 07:04:17 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 ez18-20020ad45912000000b00678013cc898sm3084981qvb.36.2023.11.21.07.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:04:17 -0800 (PST)
Date: Tue, 21 Nov 2023 10:04:15 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-9.0 13/25] memory: Have
 memory_region_init_ram_from_fd() handler return a boolean
Message-ID: <ZVzG7zuSXuw9Rm-q@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-14-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120213301.24349-14-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DyReEd/CDWA/

On Mon, Nov 20, 2023 at 10:32:47PM +0100, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

