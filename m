Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2335971ejd;
        Fri, 19 Apr 2024 04:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxttLOviSlVQnVCCeVKOr+0bv++06ifBu+8MUkeJzEu1cHhT9rL/Hb9donNaO+4HE+fHL6rdTj8Ektl50eQ9+F9du9TBbK
X-Google-Smtp-Source: AGHT+IEsPqQDWyMBVxM8WRZrvpr6LxSTU8h0hYUiEIzI5iWGYjps7De/1+NyhanwY6FVyGpt2I7H
X-Received: by 2002:ad4:4d47:0:b0:699:2243:2948 with SMTP id m7-20020ad44d47000000b0069922432948mr1892916qvm.35.1713527563486;
        Fri, 19 Apr 2024 04:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713527563; cv=none;
        d=google.com; s=arc-20160816;
        b=gTQDcr6VbsCxWR4/5g9XMTvArgYc792PJ60tPBtb9Tau1wvIlrwZ3MIeV05jBt+/W7
         V0r8Qdqlu1mcMbanZBKINuNOjs3roCIqGMKDIe7SJTMSZxt2dSgpuitgDnxKLPxAqdUt
         jEav99b4i2IJBjmlX7Qm66ar0jAhFYl0TIvoBWWayPtuDjiSbDeesTZH460NpYJnnmxX
         lbPnw2oeUsiJf9Arujd1ZYOtxLvB0TxU79eSMOt8keH4gDrgHSV8mW0pOFsrtOhpp3Pr
         kBdk0Drj1LdwggtVVkMWH8ZzlgvEdqD4nvksIl6L6TmE5+jZeGWxWEAS/J+cANzrZmSn
         RhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=OxoQ873H7iOSTFVIdgsyHNlTk6QLM+SBF/xfBDJbLcs=;
        fh=xgTnrFZ/14GrtqEy0h4wEGmndWeB1JXj9q4ouBALHeU=;
        b=ivWLnnX29SbpHydV68mmctwxmPjitYY+49odCtrqcNgEfHZxl+50zWI8nePU5AW+Ru
         pWblHj59wM+NKm6zD5NN6KD9xvXt0HwN/S5AwINCpg989lkGWzQaVzd5fcOldJEzB8j9
         pK7aD0lLkQsmxAYltdEmAz9s9uguqz5Et0bwaTdnbO/pJ3pqqYtfSUcb3RLhWy3ZxWx9
         tNjcUkKFhccowokoOgvoz/GjKsInQBjSOyg7Na9fda57FKMO/1NNzSDKJZIxT23eqPdK
         lySAhnj6QmV/ufu483q4ofyLThj2TpOPLLf6K7a61d7BySsdgw9XSSJzS5Zi7/pEKqzb
         O/uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HynawTT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020a0562140d8800b0069b1f385922si3623424qve.572.2024.04.19.04.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 04:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HynawTT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxmn7-0007I0-0b; Fri, 19 Apr 2024 07:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rxmmx-0007FE-80
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 07:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1rxmmu-0001dI-RC
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 07:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713527533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OxoQ873H7iOSTFVIdgsyHNlTk6QLM+SBF/xfBDJbLcs=;
 b=HynawTT7kU94Bea2uR7gVb4M+rsq3TEC84fwAI4hc9O0aXwE7XQTBs/I4kVcNPO5g6gxnr
 n8JpgszLjT0SPoI6YcbjZ19CgKdsZJcSQ/F3vDT7uVI0/H0yzZl1a551LrpYYzVVPinf8P
 yYuaDaLkyu6VuIwL5k51GtKfvQ++rKA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-jxL5RIEbPxyPtlKzq3f_Rw-1; Fri,
 19 Apr 2024 07:52:09 -0400
X-MC-Unique: jxL5RIEbPxyPtlKzq3f_Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 481C3382C46F;
 Fri, 19 Apr 2024 11:52:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBEDB40C1233;
 Fri, 19 Apr 2024 11:52:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC3861800DFD; Fri, 19 Apr 2024 13:52:07 +0200 (CEST)
Date: Fri, 19 Apr 2024 13:52:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: devel@edk2.groups.io, jonathan.cameron@huawei.com
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>, linuxarm@huawei.com, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>
Subject: Re: [edk2-devel] [PATCH v3 5/6] target/arm: Do memory type alignment
 check when translation disabled
Message-ID: <kjpkyoux2xcegrqshde5ddhicf33jnlelobuzuo4uj4svvlzdn@rilun7dz6776>
References: <20240301204110.656742-1-richard.henderson@linaro.org>
 <20240301204110.656742-6-richard.henderson@linaro.org>
 <20240416161111.0000607c@huawei.com>
 <0c878d25-3fbb-4f0b-bc9e-ca638f8c4f1e@linaro.org>
 <20240418091555.00006666@Huawei.com>
 <20240418183600.00000345@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418183600.00000345@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: QcHRVpdduB/b

  Hi,

> Gerd, any ideas?  Maybe I needs something subtly different in my
> edk2 build?  I've not looked at this bit of the qemu infrastructure
> before - is there a document on how that image is built?

There is roms/Makefile for that.

make -C roms help
make -C roms efi

So easiest would be to just update the edk2 submodule to what you
need, then rebuild.

The build is handled by the roms/edk2-build.py script,
with the build configuration being in roms/edk2-build.config.
That is usable outside the qemu source tree too, i.e. like this:

  python3 /path/to/qemu.git/roms/edk2-build.py \
    --config /path/to/qemu.git/roms/edk2-build.config \
    --core /path/to/edk2.git \
    --match armvirt \
    --silent --no-logs

That'll try to place the images build in "../pc-bios", so maybe better
work with a copy of the config file where you adjust this.

HTH,
  Gerd

