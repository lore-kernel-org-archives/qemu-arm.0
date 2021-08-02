Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1573663lff;
        Mon, 2 Aug 2021 05:11:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhosQ6T/vcRgvQQR2UvYeP1GXbpZ/lxSKK5Pz7hfUYCNnBtwehoylzPNjVFu5T6ceIZSP+
X-Received: by 2002:a05:6830:1dfc:: with SMTP id b28mr11474929otj.282.1627906303553;
        Mon, 02 Aug 2021 05:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627906303; cv=none;
        d=google.com; s=arc-20160816;
        b=Tkr/yIS1EeQ8KhKcHNxHRx3zXeDX1TfGsdWnbG1drcyAgz84RMP0oFKBw3tCZlqHnJ
         9M+MnKGSPH9FAtRdBBMGVjYASQwtjQ8RiH+jq0Zf8malJ66w673ymzz1T8llbD0kBVpg
         JgqOa73Czt8Jo5D9+k6dyO+il75ncPBYw1CdXz1DFXTNfcrcogub8sYFhNRMoAd6Wg4g
         HHXlbNchD1ftd1+vlUQejNfQZuhGCrSaczKk2slFaSvfBunU7/f4NoPixkGCekex57oo
         yy3oardswTxeo7qf63gkRVIs5OmkN2GzAcWBC9m1Fg5XTzbnqIq/YspdGH4kNpzGf7Zy
         ZU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Qy+bHSLelRt1MrpbxyOU1oCZ58pF6821JxWTRkqqLeM=;
        b=JNGHesNCg/rrTkC5tjfmkIzimlQfbfZNsaynIVxqrAbAG5iV8RhIHdDdlQdaIoVt3C
         JgLvWYPyLT7tBmwSpcsSiAru7ea2Yj9m+OFM4koq7s6KVF2+ujd6QuyCYFlPg1m+6Sy/
         t4D5Hx3a43msW0hjwG0DzBs++pNpc03sDuVkFK+IU9vZ+dZnqkhW88lRN5FDSV/cPABW
         1LKksORxh4iTrAqzsCCXIcw0SEz3YM0m3XCJPM5VK7EQ8GdFvy4gwbtHK2Jx3gFN6Tie
         4a/NppluD48vNF+OA0T2Ptf0FxuCoNWnaOsLPjcVSkR9tR6MZl8ESAsZGe81PGk3fCvu
         pmQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xDkvXQYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y187si6808105oiy.120.2021.08.02.05.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 05:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xDkvXQYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAWnG-00012F-1o
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 08:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWmx-00010H-3U
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 08:11:24 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWmu-0007RE-TG
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 08:11:22 -0400
Received: by mail-ej1-x630.google.com with SMTP id go31so30458901ejc.6
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 05:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qy+bHSLelRt1MrpbxyOU1oCZ58pF6821JxWTRkqqLeM=;
 b=xDkvXQYvtKbXQGhxOjaBbf21xvlVRSX3YsmGsSeS+vtwzdPDvT7yKJ523PwEfttFqt
 V4EZk6+OS0rdAB8T/t/nDjkCjVEjaiX/dPzTbQ9T+bwHC7HSaBAqzpvpQX5a8Q3hFgcn
 rU0HfEqrI9Q+sEgQ5RSbkNBGIJ3i3Fax6nWq4FAe5cvsP+Zg4mUDjhWmPuI1fqg5hK9n
 4RdJbqMsKuOXAeFB7d48bmUXFoQGab7+lDwq3+na4bw9KLhNmUw36Z4z9vLhqyN+QgnR
 YlGiSMMS5SeTlAVkuD3B4/q7q4NQFgrroaj8EXdgQdPN2hGrAkxwgQi0RsukUcod0Fvm
 A/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qy+bHSLelRt1MrpbxyOU1oCZ58pF6821JxWTRkqqLeM=;
 b=OyFLOmMq3aIYvh+0vEOMHzzAoXv+nnMg/qhs5O0ZUbgOnFRuFksChE4mqNu8ZC0bBe
 YRpeMnjcQIGVAjPosPDvveP4z/ofPOfQYvDMqUJ31xXYHK5ock886JM1hkifRvnIqRu3
 l+eHQbMrHz9JIpGGDr5Kaf6jSIo/D7YI9UxVIarroH2S9j7am4G27qHYcULWpnjU+WA1
 ftjGrTmItQG8jxTksyRpO3K19eJDNEMZZllzeEIBTvEWUFbnVmuSXqIjUDEK4WzIi7kp
 kH5TCGRcBbTNhxOZ+iYaJq7SO0uPrUbpi8DHaDorzEZqvtu6NiJY9lULNOPISW9Y7YQT
 XxEg==
X-Gm-Message-State: AOAM531qr2jyK4ZNRsnpumiakuDTqIA5A0JPoiaf+GDK82LkqBW514zU
 reC3b4V2zmv4M8CXgmkuxuirUJ7KmdwS39dKQdQtUg==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr14968836ejy.407.1627906279125; 
 Mon, 02 Aug 2021 05:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210728181728.2012952-1-f4bug@amsat.org>
In-Reply-To: <20210728181728.2012952-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:10:36 +0100
Message-ID: <CAFEAcA-_tvVnDgATXaQeM2eZew+_Vr2K1YBVsLh=JpG1Fvbriw@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 0/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alexander Bulekov <alxndr@bu.edu>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u6IuZWnrTb49

On Wed, 28 Jul 2021 at 19:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Fix an assertion reported by OSS-Fuzz, add corresponding qtest.
>
> The change simple enough for the next rc.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
>   hw/sd/sdcard: Fix assertion accessing out-of-range addresses with
>     CMD30
>   hw/sd/sdcard: Rename Write Protect Group variables

I've left review comments on individual patches, but my suspicion
is that the fix for this assertion failure is just "the
assert should be after the test for 'addr < sd->size', not before",
something like:

@@ -821,8 +821,12 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
     wpnum =3D sd_addr_to_wpnum(addr);

     for (i =3D 0; i < 32; i++, wpnum++, addr +=3D WPGROUP_SIZE) {
+        if (addr >=3D sd->size) {
+            /* Out of range groups report as zero */
+            continue;
+        }
         assert(wpnum < sd->wpgrps_size);
-        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
+        if (test_bit(wpnum, sd->wp_groups)) {
             ret |=3D (1 << i);
         }
     }

-- PMM
