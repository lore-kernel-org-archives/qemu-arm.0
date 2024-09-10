Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1254547njb;
        Tue, 10 Sep 2024 05:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvNCGl4MmzjdhTHrfCjeT4rsFEEvdhjpnxuKvQXpVtBcb+qTBRecdCrY9LAp8AF+wC7zl8K/Ko2yKYxA==@linaro.org
X-Received: by 2002:a2e:7401:0:b0:2f6:6127:8ead with SMTP id 38308e7fff4ca-2f75b93552fmr54173171fa.32.1725971745209;
        Tue, 10 Sep 2024 05:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725971745; cv=none;
        d=google.com; s=arc-20160816;
        b=NggaYFm04bq2mZwveaXD1/nBmbEmx80ZhEeO50RPTA2bslCliCXUnqPXkOFTmzK859
         DCpjdnB9hE0Pnxjd/vTFaEtqKcTWWxREW60RdQjiKpvJ7LuymHfMe6pvGAVmBhRS3wEA
         Bdn4MDbAPgm+u9denOZkBcDLv/g4JfQU7J5bC5OqoyLX6yZNu4LweBel0FgRel3A+qJG
         sNxYiC4RZ1Q5mVpAF5UGjac/dcMerdAmBb5plnUt/pl5FNvgsXsCLn6WVDr8bc835a0U
         rduvqG77w+HXPp5gPTVjJfC4SDlkUfFd3yRPyCJS/eWKj4TnYVysobVBQ8njCnPhxyMB
         gGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=/p/YzRh+Qza96Ha1nUOAfe1Sc575l7UKV3VGGl6ZupM=;
        fh=RJ4GEO1NPfkfQObDjq/WrQ4TunwnHiUmp/fVNNTVSEY=;
        b=u/ozTHFHAXsNUUp3MxczsoK/jCKmhuY+yWEhYthWW20MIjiPuizUFGoImV8xAgjDvf
         rGvqyOcnDSYlw/SKDaJrooQDqCyclmmIqLEEwKwCHT0Y8fOOHLP4CCE9dNapOQk17y1f
         iCFxkmPBr2qmXlOCiIW4EVKFcP0WsI1ZD5jrOSmAqy7rSYwoSRSTZM9nyFIB8sswYvFZ
         EE+ooE+J67JWGBohd4ivCo0sY277XBptsRhM1CqEJJAxQ1MGwcvgqmnMQbc3OaxxvBCG
         uTBWYfwRmM3mvJVDCshanH5U0uBzhaj96JUzXZOH8/MvogO98Y1I+e2BOXYV/v5IIUpF
         kXPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIhmRTeP;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f75c08bd65sor11053531fa.15.2024.09.10.05.35.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 05:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIhmRTeP;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725971744; x=1726576544; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p/YzRh+Qza96Ha1nUOAfe1Sc575l7UKV3VGGl6ZupM=;
        b=DIhmRTePZCJbhILAYw/BlJXsfNnZlBFyEHRLWKltXNOMfyU1S7DAD86a6sVwfu6YlO
         fDWuutPhQpxBuYgz/wkxTCQGgwgaUd2L74jMyik57A1jXd4l0z3d2n74q1hcTeBHJYtS
         GvUQCmy+Fv1DrDqti5aZaStPem+X5HpGRff4IiBorLZE6q/OyGJb0qz0YQMVZKMA0w4H
         2kRP4t4y4FeB7Yyi/vMD94PuF4FsY5n1+I1FncX8f6NQdHclIlholhihkr1FT3svaBUf
         m/jTdm+ofl1O/Slh5KFEK06z0OnTbC0U2HTzA5ldT2jlCRQUk7NDmZBBi8gjlbfXxH1w
         AClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971744; x=1726576544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p/YzRh+Qza96Ha1nUOAfe1Sc575l7UKV3VGGl6ZupM=;
        b=e5pxWGiqi4EhpeTOtzBYfkeIDq2hyL2z9Enje+nL8+RWhQ42OSQbbZTrE6FeIwQSM4
         /Sn2WBlgH8J2HYNKTN8a1SpmhG8Ziy9EficAzQGt1VlmBkxS8r4ylc2ONk1KoWN5n73N
         h0m2MH/sbdC/W71A9UNZq/ZRUO+RIAcJZEiTnom2spxuujLU1PyvSCLbbI1rdG9oO99i
         Ho8Lcel8IKmDH7rr30FbsVKrhQxVsr+TEP25UOdK0fL4sav6potnqTKMYEic2C1LTLTU
         ISeIeLANE8936VFnsfUHxNXNaeTNb+1Vh/1oE+YMsCYlmZHaES4JiJjRcsOAJVNJz3MV
         9SZw==
X-Forwarded-Encrypted: i=1; AJvYcCWKTMVDjDitRZhCrdgl8oSM3MF1Bej1THkFhtmKDn7+uvfbR3nokRL60JYh6mP/ArjdmOi2XOJthL3gkA==@linaro.org
X-Gm-Message-State: AOJu0Yx2CXdIoAZZXi+DItn6KrRIJRlYfGHTRAv+2TLtUqltRYmod/8F
	8RsmZjhDky2dfSd0vrMv5vSWVGe6p1xJ8lGyUj8F8jc2j9VaS7IC/rM1Y/JOocHUX65yZSpuiyV
	Agtc1mg==
X-Google-Smtp-Source: AGHT+IHBaHrtZi572QPsoordzSGSjIbcx73H1pxyLVlLXOWfuK7Mx6oAoYXPBY+ejfGD8ZdQrfGqSg==
X-Received: by 2002:a05:651c:556:b0:2f3:eeab:7f17 with SMTP id 38308e7fff4ca-2f75b9420a8mr81868301fa.41.1725971743654;
        Tue, 10 Sep 2024 05:35:43 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-234.109.242.225.tellas.gr. [109.242.225.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd41cd7sm4242994a12.3.2024.09.10.05.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:35:43 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 10 Sep 2024 15:35:12 +0300
Subject: [PATCH v10 6/9] meson.build: add HAVE_GLIB_WITH_ALIGNED_ALLOC flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240910-rust-pl011-v10-6-85a89ee33c40@linaro.org>
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
In-Reply-To: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Junjie Mao <junjie.mao@intel.com>, 
 Zhao Liu <zhao1.liu@intel.com>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
X-Mailer: b4 0.15-dev-c2c95
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=z+DYU/VsMAumDk8UU8SzrDji8IQmGTT50i4PLUQ3KGo=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm00RDBNaEpCR0lySElSYStBVTFJUFQ3cUI4OHN0ClZKMzFCOFNuWWp4MGpzVkJX
 Wm1KQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnVBOURBQUt
 DUkIzS2Nkd2YzNEowTHdvRUFDY2x1VURFT1ZvaVAzK1hIZUk5NGlEbmlabVcrUjBZVnJ4amE0ZA
 pzOGE3UnN0eGRPR29md2wvY0xSMWU1M3VqMFlGdkh0ejl4WWtlTzc1KzJsREx2NjZORFZBWDBCe
 kUxM3JnRVJJCk40eGJsSkdaYXRVM3g1Wkc0Tml5bFo3ZWI2Nis1MnlPd0RsNkR2SzY0ZUY5YVVL
 SUtZS005QkVQQ1FJbkRURTQKWlJnVDAzYnVKS2J2L0ZNWU1MTy8rdzl5blI3SXRmMU1aeEJETTl
 YU054am9wOG9mZUN1YUt5c1Z6RkU1b3MrRgpSZ1lDZGNaOWVIcTRvRG5zNTNFbDhNQ2hOY1hYR0
 pJcnFPZmwzSXQ4aE04M3Z1RnFBU1FydWJuSzZWSit4aWVYCkhmRmN1UVlFa1NieFV2M3NmR1lTS
 XlEdlpCWVZmMnhmaEJGSncxbFIyNGlHVXg3Wmp6ZStnWllBeEVyWTNZWlkKQjkyWmN3bHBWNHVU
 MGh3YkllZURyTWNseHdHL1RLaSswZmNPWjVOLzRHUTdVeXlGQWJnbXBaYkpWQVdyMlJHNgpOTW1
 ESXRkcysxbjNFbVhhTnlVbmRGUlFvblJZQlZkV3FLQ0I1YmNwb1hhbGZ4T29wbnZ3Z1RiekxHNW
 pZa283CjhLd05DS1M5SE45SkFrOE5SUjR3RllMREFUL3dlWW1Kb1lkK2JONzl3eVYxNG03eGlFa
 0V0UHdPQ2Fjc3ZhZmoKV0xKazdLTTl2eWYwWVlYa3FYVkZ0a1lyMDFHTUZWWmxwT1FXLzd5d1B4
 UndYSW1xYnlWbXh2L28yREJJN0JJbQp1dVdyRnROR0pLZCtVTklxYXBOQTUzZHNZdnlBQnR0UUo
 0TVFxYUZhN2pIUE92ZU9peDZmaGp0enE3bjgrSWFlCjBGbkJMdz09Cj1GN0dXCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: 2pru/xjnR4KR

Rust crates, introduced from the next commit onwards, can optionally use
the glib allocator API and need to know whether g_aligned_alloc etc are
available.

This commit adds a define in config_host_data that depends on glib
version >= 2.72.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 1a03f7e15f639799889933c19bf17c2b8f00d879..0c9c2d4f60845d5f959b10424ca2b11b655cf51d 100644
--- a/meson.build
+++ b/meson.build
@@ -929,7 +929,9 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
 ################
 
 # When bumping glib minimum version, please check also whether to increase
-# the _WIN32_WINNT setting in osdep.h according to the value from glib
+# the _WIN32_WINNT setting in osdep.h according to the value from glib.
+# You should also check if any of the glib.version() checks
+# below can also be removed.
 glib_req_ver = '>=2.66.0'
 glib_pc = dependency('glib-2.0', version: glib_req_ver, required: true,
                     method: 'pkg-config')
@@ -979,6 +981,9 @@ glib = declare_dependency(dependencies: [glib_pc, gmodule],
 # TODO: remove this check and the corresponding workaround (qtree) when
 # the minimum supported glib is >= 2.75.3
 glib_has_gslice = glib.version().version_compare('<2.75.3')
+# Check whether glib has the aligned_alloc family of functions.
+# <https://docs.gtk.org/glib/func.aligned_alloc.html>
+glib_has_aligned_alloc = glib.version().version_compare('>=2.72.0')
 
 # override glib dep to include the above refinements
 meson.override_dependency('glib-2.0', glib)
@@ -2508,6 +2513,7 @@ config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
 config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
 config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
 config_host_data.set('HAVE_GLIB_WITH_SLICE_ALLOCATOR', glib_has_gslice)
+config_host_data.set('HAVE_GLIB_WITH_ALIGNED_ALLOC', glib_has_aligned_alloc)
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))

-- 
2.45.2
