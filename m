Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp1979842ejb;
        Sun, 12 May 2024 23:33:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJkMJcTrfOD0dKN580Kjh2ZIAbxLnXDI5NTbygkDvluZt8vvu2p0rlAXbXfU/c7tSem5QBq858n0kXQMy6MoBGgIkEDyd+
X-Google-Smtp-Source: AGHT+IGh1KEulC3TBzs6XFskDif/wZlkUVhULTVxF26R2XqWqcKqrS6fZswWKPjVl3j8Jlt1gEQa
X-Received: by 2002:a05:6214:43c4:b0:6a0:ea1e:833d with SMTP id 6a1803df08f44-6a1679a6a4dmr166412286d6.27.1715581986879;
        Sun, 12 May 2024 23:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715581986; cv=none;
        d=google.com; s=arc-20160816;
        b=e3UAokE4xFzMNaVcsKf5bDm4L6JsFD50OV2l1KVbC/QES3faaUVea//crGuC7wnUp5
         Uhi/sfDF/xNhfdMGGu3lHfUZxqODaoDBNJ1GNNy0h17fY0oEmiUxp+QKQ+4gcgP9lnDV
         J8X3OzuZb2NzJPdqgwpyzkGqfbv0XVEbyY6CNb1oaDYwHPr+A/ui3kvFT/AND1DLQJtZ
         kaXGVZ1U/BntrPcF2Dybj5BsZexGwXmJoJkqALzviVl2ONtcq5G5Y+5fkAzmbMDRmwkh
         O3ZPL/0gsrWSiaQKoUJH5Afpzup1jWpcyL5iICXovriLrHWQKVd41nqu4tdE92ZPOD8o
         7leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=jvbzGvPlv8G9dFmGbcvmUmCem2OFs6nu+A474Eosqec=;
        fh=9h1rfZ3YTi7eetBD4VxOx89GP6Zyf0Oa+YaVJWfsGd4=;
        b=wRintAaZQedmbU5froW4CQo+fF8llHls+NnLgCIWsZWHAqows7+UveK4wJulUp9R3n
         wEMQeaPGtwP+8gDST8BvOhKlFWh9WHI2H2UJ2auPqlJ5qws/wko/X5j3lSJxrgWpO9yv
         eYbLzEUtxkgvs7o7ihTAoYNnwKp5JMbRafWMV7Juvdlz6oLOZ+PBJ1qkT+Gi9zGPW0QH
         dnrlcDzlIjcxK7yyZ1URlNylr/kfLVI3bmyl0lWofPsIHvZthJjYaIvvh5p4sdvMBzlg
         GKuUuIV27Re0CoV39SZi9sa9m+D+AWjpSIF1ahiT9s/BMM59+k1GGgvPsZ8c3OKCioZh
         ZIdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKbyvCeC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f2edb5esi90738216d6.473.2024.05.12.23.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 May 2024 23:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKbyvCeC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s6PEH-0006xn-0i; Mon, 13 May 2024 02:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s6PEC-0006vd-Dw
 for qemu-devel@nongnu.org; Mon, 13 May 2024 02:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s6PEA-0003up-SH
 for qemu-devel@nongnu.org; Mon, 13 May 2024 02:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715581922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvbzGvPlv8G9dFmGbcvmUmCem2OFs6nu+A474Eosqec=;
 b=YKbyvCeCTlkZcK5RleoYhoap57Ro2rwynIFcexQlGB52SBT726Z8d2VixOapJWTFgHCUaN
 0cqmFg7mCscIWVnUszMLPjlfSB3SCgSxPYrXsNvtnS1hljXs1Z1Y9foFeVdN/lQsKPYJ75
 EHaydPfFf3E6J9t5mSSSa/CMYKQiet0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-vsDX1vnUMhmmNgNAbdaI0w-1; Mon, 13 May 2024 02:31:50 -0400
X-MC-Unique: vsDX1vnUMhmmNgNAbdaI0w-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-572ba1df326so663428a12.2
 for <qemu-devel@nongnu.org>; Sun, 12 May 2024 23:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715581909; x=1716186709;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvbzGvPlv8G9dFmGbcvmUmCem2OFs6nu+A474Eosqec=;
 b=OBWfWkCJsyn4QS+hpXev9xa4+UwVhcdJLZximfV0jst7hNMLL1eXbM7n9YSs6Wnz/b
 pUHec84P/6xZVA3JJsesSydGge/XqmFQPZwhqms9AO7bdPOCdxeGwOzT+w0754aK9q67
 mP0y4ydur9bBRHEWhYkdzFIH+4Uvh11gYOqODBvbqNQm4ZlCQQGZuKkSnUycbJQrnFwB
 jqXvvppsosNCHbK5nRWOLZnwoHgfTnifWuRPhsd+4AYlnWLG4a6+oklU8LoIRn93ngci
 eC8B6eZ1WU6oC+AaEKnji1/LbHhFvwWTNPGiiiR/N3GsM0kR6sw+t7Kb0HUqh1xZQcED
 RS8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGPD3a7bkIVvaEEeGlzYlmiQasG7EZxLOs7EmTPWik001zmc34lUQ+eNrugq7Q/jtzCBzVft6oePY+sbIy7oVSqJVJMEY=
X-Gm-Message-State: AOJu0YwkH/wPEcHvwGnc52yyHC222CJJXsnlN1fhyacDMOnov8sWnc99
 GnZkvxymvlr0gHwyDeC+cKPSa2GG9Wg3Btyt6wn9tMzRaVwyrT0G2lqq+Jumx5LaTs9Lz1YzUhr
 z7js4+HHDcvDNya+6DPh9Ois/FYjOhTAZe8DzoqG47fag33APfKBE
X-Received: by 2002:a50:d482:0:b0:56e:2b80:d87e with SMTP id
 4fb4d7f45d1cf-5734d597b89mr8748065a12.2.1715581909113; 
 Sun, 12 May 2024 23:31:49 -0700 (PDT)
X-Received: by 2002:a50:d482:0:b0:56e:2b80:d87e with SMTP id
 4fb4d7f45d1cf-5734d597b89mr8748029a12.2.1715581908511; 
 Sun, 12 May 2024 23:31:48 -0700 (PDT)
Received: from redhat.com ([31.187.78.170]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea6557sm5732886a12.13.2024.05.12.23.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 23:31:47 -0700 (PDT)
Date: Mon, 13 May 2024 02:31:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, imammedo@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2 1/3] qtest: allow SPCR acpi table changes
Message-ID: <20240513023110-mutt-send-email-mst@kernel.org>
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-2-jeeheng.sia@starfivetech.com>
 <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KpH0rIB0oIkR

On Mon, May 13, 2024 at 01:55:50PM +1000, Alistair Francis wrote:
> On Tue, May 7, 2024 at 3:24 PM Sia Jee Heng
> <jeeheng.sia@starfivetech.com> wrote:
> 
> Can you describe why you are doing this and that it will be reverted
> in the commit message?
> 
> Alistair

What motivation are you asking? This follows the normal acpi test update
procedure.

> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..3f12ca546b 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,3 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/virt/riscv64/SPCR",
> > +"tests/data/acpi/virt/aarch64/SPCR",
> > --
> > 2.34.1
> >
> >

