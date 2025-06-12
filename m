Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2238823njc;
        Wed, 11 Jun 2025 22:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIcYUcab7Q23eks4Dv2IwZcf69fTFDF5cgIroVk0CuC+I1UDyvL9CtNgRLT7wY1e6ZuWtXUAwcrhIRKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGwaRKUVs8S6iKIQXOEVkv8i3GUcXH9E7K3+rSvr0ZmKyw/CBA8aD8USgQXED3NMnzoIAQ1
X-Received: by 2002:ad4:5ccc:0:b0:6f5:1192:ccdf with SMTP id 6a1803df08f44-6fb34763015mr33773676d6.6.1749707192228;
        Wed, 11 Jun 2025 22:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749707192; cv=none;
        d=google.com; s=arc-20240605;
        b=A/T72jrZQcRVrUt05DFaQxqqngB61+VPK4uQuu/BH/1l/ONVQ1dYyr10UhT8jEgwoj
         8XFzaDEMvTiguP9L8cLoIEOd7Z5gQEzGYGSQJOVnpcyKSTw7mOqRNPoB2cEASnXsAuIf
         T5jSFVT66YQViy1AocrIaC5o1himT3ke+FJYkv43VXXos5uwcBF7W0p120MOUod/eKSf
         p8OMrdciLYkVI4RkIL2rc9tAL3qeb/txfuWlUS9ksAHeXWUbAwv8FbKoAxiPnHpXHklV
         RfbDiZiZkruvd3hoO9HTn/2uHLQzi/YZv1B/hF1WHUk1GCI0+bV31IRWGfTsFCpPR3wu
         XZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=uWtXl9tUGCTILZjTP+f50HFmNhKS7AiuhqytRSts3uM=;
        fh=pEQP+W+VUiU2Been7/1v/MtIeLH9wQGraFp7ZOvFSjQ=;
        b=S6ewBNTYvBg6yPFIzbjUOG9QEDaLd9pIxV66IClQk1S7Usowlc3qkhVd413ZGhQjG4
         UftHm7EqDrNA7tvU3s0nLBxyNqxR/mDY0TdlFoIYWlZ46nLbUkH3LQ7HQ9MadB84EB92
         BKWiHfhdfQ8aq3Vjzwxft2f+4JQgFnAwgf4QZpXK7AeEsqylRiUyO9qjVPbVTHj7mOZ8
         HHZPmxoWw4t291Hq3A1wazoSIgf52wVJoDzaQMZl3rBQKgkk0HBby8NHs6cPHIbDQ+jV
         HHzyFTW5mJqIlGW0aQs9rM20l/VlLkDReJ6eD+3YNScUqeVVx6nrFKBpyJjYTH6Y5R0I
         935w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dX7kTEWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35ae55fdsi8864696d6.118.2025.06.11.22.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 22:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dX7kTEWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPalU-0006nk-Jv; Thu, 12 Jun 2025 01:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPalS-0006mo-7K
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 01:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPalP-0002TP-1h
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 01:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749707168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uWtXl9tUGCTILZjTP+f50HFmNhKS7AiuhqytRSts3uM=;
 b=dX7kTEWbsxvaBHi9WFxBrST+WTK1T/WCyTgAfKhgYUiGpb6HUPcMySY4BNX0cxV0Cpy3OU
 gtKto9XamWHdB3U2uJOjh/L8vpGCt9NYVFZa0k/CiL97znqguW5+Npaw2pMTQ39v9i6Ljx
 k/vXcjCRRxUZQlS0rDmX0CCBziLQZoo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-nCi0TYHjPEyS2khpBalmnQ-1; Thu, 12 Jun 2025 01:46:07 -0400
X-MC-Unique: nCi0TYHjPEyS2khpBalmnQ-1
X-Mimecast-MFC-AGG-ID: nCi0TYHjPEyS2khpBalmnQ_1749707166
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f55ea44dso245570f8f.1
 for <qemu-arm@nongnu.org>; Wed, 11 Jun 2025 22:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749707166; x=1750311966;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uWtXl9tUGCTILZjTP+f50HFmNhKS7AiuhqytRSts3uM=;
 b=XI1Ox8i5YUaV8OfyOwCYpNy+yIUYN3+kPN1WiOJUH6ouHpMS2sGisPptwnuD+RoqMW
 e/xWmiP8OxuxMzVRqsckttc0GX+ZQW0xXdbogl8OKsvBqE46M9p/5KUCkQdRtwwFOFJy
 hnxijHlXU+YKs3Tibf4led1Y9GzcwkRFixMh/T9VBWBac6mru3j1haHFW3jUq9iVA7LV
 QoBZm/9rwVgErRreqlA4VkrS3/rK5wdnunHR22ZO6JAS9qfBv5YRJnMRrzl2EttWJpsG
 NvVwiIjBPQ6JPW0xhdMnGR9Xpr4V/qrMQMxMjc8SqcvoVYziB2xJLfsadnInp5/s0qrG
 95RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr1A0RLl3+5m06zV3lOQCIyObFFHPMh5Exvof30FVPmcpe6v+JHEwoVK8BCyk5bxkJec3xeJ/jmQ==@nongnu.org
X-Gm-Message-State: AOJu0YzTVta+8mBxrfrdW06lVyzcRb6e4J9K/8dsUJuFeTqbEhOqthDl
 J3Ri2WHQA2RROdc+i4CApkFlSvwEswHbMihyLh+Gdy/6vY+1lX7AExDOg9oju+5Wk02vetgxG0B
 UZ+N2wA33EDUgIHx1U7mIeUebrQB2Ryx0t0KnqQ8nlPNOoTR7fPH05g==
X-Gm-Gg: ASbGncsANF1bha6wDDqyPRgWTyLVxoqQgz2tm+q1Rbn/0qVbJhgAdXRRpY4PdsIf8Zo
 i6OfOanT0DhkNbdR+BOCLu8fCWjb6HJi8F0izscP5fdtcG4iXXGHUhRW8gXvtkLxR/CZAiznzzr
 las9/eyT84jZEm5PD0sh2aEXXotwYnO1VxaAo7mEwOL54NR/al+3UGEuu03TvE2N0cjYCw4dlQr
 Cpuvk3qdoGWyrnMCEbX4gbClN4ff1227c/DQ/NaRKNcBmtpOhWrWu6Ah2YLs48m9Ut4E0UxNl6O
 G3KeaqgwDq6lciIeTgRlm7TB
X-Received: by 2002:a05:6000:2408:b0:3a5:3a03:79c1 with SMTP id
 ffacd0b85a97d-3a56138ae5amr1231528f8f.48.1749707165820; 
 Wed, 11 Jun 2025 22:46:05 -0700 (PDT)
X-Received: by 2002:a05:6000:2408:b0:3a5:3a03:79c1 with SMTP id
 ffacd0b85a97d-3a56138ae5amr1231509f8f.48.1749707165471; 
 Wed, 11 Jun 2025 22:46:05 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a561a3cd54sm890590f8f.47.2025.06.11.22.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 22:46:04 -0700 (PDT)
Message-ID: <d2860e38-241e-4778-ad9c-7042c73edfd9@redhat.com>
Date: Thu, 12 Jun 2025 07:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] configure: Add dtc option
From: Paolo Bonzini <pbonzini@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250610204131.2862-1-shentey@gmail.com>
 <20250610204131.2862-5-shentey@gmail.com>
 <cdfc561e-23a9-607a-d9a8-70e07e73e0fd@eik.bme.hu>
 <aElCJnmjrB-X9M-n@redhat.com>
 <6eb6aa79-33f8-57ea-5714-af264557f8c8@eik.bme.hu>
 <c29386d1-1a4b-4f3b-a669-4206c366ad9e@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <c29386d1-1a4b-4f3b-a669-4206c366ad9e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GyDkAMmRO4_dl9fr-GbBPc8sdeV7vtsKNj1DFiH-c8s_1749707166
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
X-TUID: +qzMtC0aAzQq

On 6/12/25 07:12, Paolo Bonzini wrote:
> I'll send a patch to the upstream dtc project and you can add it to QEMU 
> via diff_files (see commit 64644bc4eab2f for an example).
This is the patch, backported to QEMU's version of the dtc subproject:

diff --git a/libfdt/meson.build b/libfdt/meson.build
index 0307ffb..6581965 100644
--- a/libfdt/meson.build
+++ b/libfdt/meson.build
@@ -30,6 +30,7 @@ libfdt_dep = declare_dependency(
    include_directories: libfdt_inc,
    link_with: libfdt,
  )
+meson.override_dependency('libfdt', libfdt_dep)
  
  install_headers(
    files(
diff --git a/meson.build b/meson.build
index b23ea1b..7def0a6 100644
--- a/meson.build
+++ b/meson.build
@@ -54,6 +54,7 @@ version_gen_h = vcs_tag(
  
  subdir('libfdt')
  
+dtc_tools = []
  if get_option('tools')
    flex = find_program('flex', required: true)
    bison = find_program('bison', required: true)
@@ -77,7 +78,7 @@ if get_option('tools')
    )
  
    if cc.check_header('fnmatch.h')
-    executable(
+    dtc_tools += executable(
        'convert-dtsv0',
        [
          lgen.process('convert-dtsv0-lexer.l'),
@@ -88,7 +89,7 @@ if get_option('tools')
      )
    endif
  
-  executable(
+  dtc_tools += executable(
      'dtc',
      [
        lgen.process('dtc-lexer.l'),
@@ -108,7 +109,7 @@ if get_option('tools')
    )
  
    foreach e: ['fdtdump', 'fdtget', 'fdtput', 'fdtoverlay']
-    executable(e, files(e + '.c'), dependencies: util_dep, install: true)
+    dtc_tools += executable(e, files(e + '.c'), dependencies: util_dep, install: true)
    endforeach
  
    install_data(
@@ -118,6 +119,10 @@ if get_option('tools')
    )
  endif
  
+foreach e: dtc_tools
+  meson.override_find_program(e.name(), e)
+endforeach
+
  if not meson.is_cross_build()
    if py.found() and swig.found()
      subdir('pylibfdt')


and this is how you can then find dtc in QEMU's meson.build:

diff --git a/meson.build b/meson.build
index 61595015802..831678b4580 100644
--- a/meson.build
+++ b/meson.build
@@ -2121,13 +2121,15 @@ if numa.found() and not cc.links('''
  endif
  
  fdt = not_found
+dtc = not_found
  fdt_opt = get_option('fdt')
  if fdt_opt == 'enabled' and get_option('wrap_mode') == 'nodownload'
    fdt_opt = 'system'
  endif
  if fdt_opt in ['enabled', 'system'] or (fdt_opt == 'auto' and have_system)
    fdt = cc.find_library('fdt', required: fdt_opt == 'system')
-  if fdt.found() and cc.links('''
+  dtc = find_program('dtc', required: fdt_opt == 'system')
+  if dtc.found() and fdt.found() and cc.links('''
       #include <libfdt.h>
       #include <libfdt_env.h>
       int main(void) { fdt_find_max_phandle(NULL, NULL); return 0; }''',
@@ -2136,8 +2138,12 @@ if fdt_opt in ['enabled', 'system'] or (fdt_opt == 'auto' and have_system)
    elif fdt_opt != 'system'
      fdt_opt = get_option('wrap_mode') == 'nodownload' ? 'disabled' : 'internal'
      fdt = not_found
+    dtc = not_found
    else
-    error('system libfdt is too old (1.5.1 or newer required)')
+    if dtc.found()
+      error('system libfdt is too old (1.5.1 or newer required)')
+    else
+      error('device tree compiler not found')
    endif
  endif
  if fdt_opt == 'internal'
@@ -2145,7 +2148,8 @@ if fdt_opt == 'internal'
    libfdt_proj = subproject('dtc', required: true,
                             default_options: ['tools=false',  'yaml=disabled',
                                               'python=disabled', 'default_library=static'])
-  fdt = libfdt_proj.get_variable('libfdt_dep')
+  fdt = dependency('libfdt', required: true)
+  dtc = find_program('dtc', required: true)
  endif
  
  rdma = not_found

