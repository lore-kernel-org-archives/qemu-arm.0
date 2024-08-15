Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp819557njf;
        Thu, 15 Aug 2024 04:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9MbXq4OnhrAlVdTJ4LNES16RqGGmTcPGE6xXf0NoS1E0VkFOJgqnxTv47wIhLoDHv9rpqLgU472MhCIAghGrnIu2QPlQe
X-Received: by 2002:a05:6512:b24:b0:52c:859c:91dd with SMTP id 2adb3069b0e04-532eda670d1mr3576307e87.5.1723722166065;
        Thu, 15 Aug 2024 04:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723722166; cv=none;
        d=google.com; s=arc-20160816;
        b=0VBYfsrKgNsTpVfXngMYVInrMDEEk9dLVQAzMziaWENbmaLAtIWWJ+KMRSE5Pps6OL
         CEMD6ne8Ti93JT0W22W0Nnah70UFmgbZVcI1DL+PZMB9J7DY/gkxEUgCV49+ByvPK9/+
         aF/vp8mBKIp8neR+xz6S5/quL1UThxIqqNy+godPYy+DtpWXtlCxPrAPbbRSFc7tnMA3
         SuuPMQ1FSA5OIyG9GjLHlpc/S5vnu9whHd+L9mOpSofKi2Q0h2xnHbcW0B4mLuCu59Wf
         3bs3GA9xPExRcKO6ELrcoB7aa79U+c4NhvC0Ylcxwi4p5k/JHWWmBo/9crMM+T4YYdU2
         8m4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=FzUpp6Fi1RnlgfSqrQ44A3uw7FwtxkcGzmQ+3Wqxx7k=;
        fh=A/3DfxNXQkKvjDttFHqNz3cY9oK5WDikn3E6Ea0WdKg=;
        b=miQzj3GBXxE+4cPmrsMHRrIoS8gCuy3r/8xyzcb7Y8Jig1LjBUjlDVph8xdGUuimLY
         I67fo/6uM9Hn9nhwXTEHGTQecHj3TcHMrOSgEBYklH4KDtjDfoFOu+Cfcw8vPaHRPyNS
         YKXi5VSVDdt7WRI8eQThVrhTxOBlC+Tet4SIm0XO9Mi8lUWijoww6w+G/+DKlEtGSe7A
         CHf7xEgsHpyDv9W+sGxw+/2c4luArsau9YYFQS9RM+2Fy6RrrRTn5rjFZRa7YbUUZ9q8
         BZQrOZTN4bAaASvNl9uKeax9boM4rP/zc8aZRVJHRkQK/vT5+WeYsK7UppnoD86nB7kJ
         sxtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtS4CDfm;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d3b858asor382116e87.7.2024.08.15.04.42.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 04:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtS4CDfm;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723722165; x=1724326965; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzUpp6Fi1RnlgfSqrQ44A3uw7FwtxkcGzmQ+3Wqxx7k=;
        b=xtS4CDfm08htBgHEr9VCIXI31NgHcucRnoU0Lj0D12GHcFJwwyIFX8YfyuVISIupg5
         yC3WTyMLwNfRwNfM5ZQn3RgsnSxPd1N2ecysUD6zNNUeQb7s1xBzMfk+WB+Tfev43N/M
         wNo2frty0Oz8e0vQWGO0+o1C8yS6Wyg55ooqy5V+TEF9XLP31syOQpig/xnECSIwWZ2c
         B6oPH87tymKZVcguhLO6RmkITOBNzXxkb6CpBOO+rNvSvWyfFFvuzbvqcc8AQPInmWw3
         +QD5g+iSlKRwodnadDNGvG9vza+iHqXZVcqJ19vvGlKbzps5DQRHvg6O8eGjo2OH3sHY
         f8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723722165; x=1724326965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzUpp6Fi1RnlgfSqrQ44A3uw7FwtxkcGzmQ+3Wqxx7k=;
        b=wN/3PA+VmjL5xK2TUnpjfsZMQ+DQ/9jE8gruz7IcBhDsH9QccDkEiD8HZwyHWkhiWI
         kd/ynf4pK3OAaZ0bJu+WKVYUsQOpG+JCJ7CfEagX7YLpOpLL7E3ovfjx+Tg9tcc0bUPx
         qPSqV5aU9+zIAH2i5qoIqh1AoCeJ7Ci3iIcakilSW00wAcqIvlmg63y1dsFC9yumfi0Y
         b3wrhXaOCksgqfuX34D5oz3HsZv/cQQ1NKyTwJ/hw0EygC3cc/81zKh8a89djp+R+/EK
         6CRY6kFcVvQ9LiG2OPzAOiFDFYlfAlCX60UqTUec1s8+sqn1PQS1zCfhdyQG4/zWGXGH
         IZHw==
X-Forwarded-Encrypted: i=1; AJvYcCWnn/I17raZAh0rh1cb646LP6oKw9dF4mvTdY6ZP1uPQlrEPTxNJ821rlp/X2UNGPUtrxoBQiO8vla96a0UnL6ZCgB+fDxM
X-Gm-Message-State: AOJu0YxeaW/1FTy+JNkN0cVTmfDlCC55hBdru6/I36K4/C1l8eEETKHz
	sm2I6z/U47z66+QQbWj0JefZuf1K+kI7iWyrUkf9KBnVu6kvR4nZ9extVT7K9Sd8fQ==
X-Google-Smtp-Source: AGHT+IGeI9y+BQkOMLUrhP3hqn9MlEkhUq6NtXKkVTFziFoiDwgVV/9XdapMuZUsyaKpIJ8gqR405w==
X-Received: by 2002:a05:6512:3195:b0:530:aba8:d37a with SMTP id 2adb3069b0e04-532edbae1d3mr3360658e87.37.1723722165225;
        Thu, 15 Aug 2024 04:42:45 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-26.37.6.162.tellas.gr. [37.6.162.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6bf1sm89547966b.21.2024.08.15.04.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:42:44 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 14:42:18 +0300
Subject: [PATCH v7 1/7] Require meson version 1.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-rust-pl011-v7-1-975135e98831@linaro.org>
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
In-Reply-To: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Junjie Mao <junjie.mao@intel.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com, 
 Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=gbp6ZWDM9aBE3sP/4abftjNYYPlmCRvIHyPSrr8nbBM=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12ZW10MnhDa2VOc0NZVG83UnhXd05Ud0EzRXNlCkx1MGw0RStaTlpMai9uY1Nh
 d1dKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnIzcHJRQUt
 DUkIzS2Nkd2YzNEowTkttRC80N2h3RGJrUGkzcm9uV3U0dXEvaVJEdUQ4ZG9scjZIc25KT2tlOQ
 o3d3doNjlQakZxMFM0VUw5ZVhDNXZJdTZ4ZlFKVlhwcXlRbU01NjA5alFuSEFobmxBTUFyWFNXe
 WljelNQS3dWCjB1RjA5MTNHMXVCTTBPWWI2c0hqbnFCYXVWbE9QNkcyZlVoVi9BdjF4VnM1MVda
 VWw2U2U1N29PY3k1Sjh0S0cKVXczbFJxWmdWNHNaSWFtTEpERWx6bTd1TWpINWN3ZG5SZmRBTi9
 PTGtIc3pMNjA2ZkxkKysyd3pBRGxzRUgvdQpRclVDdEdSTjNFQUFXUjhFREZZRFowSW1xcGdxbD
 d2OXVrcjZjbGZNclFQSFdrbHNIKy96Y3BrSldJQXM0RWJpCmx1WlNLSVEyYUR1MUk0NGQ2S3N3Q
 1llclAreDh0ZE1UTGdaVThqbzEwdmxoM3RzZ0ZaT0Q4Nm9MRDRFK3JTakoKVi96NklFcXlFc1Vq
 bXJuZGZtUjEzK0VoakcxRlMycU52UlAvVi9EZEFiVVFtSDkveUZYMEtjMEwzeDQ3R2c1cApNVE9
 GSVJtU0Ztb2h1elhMajJ1TlF3ZkRDdTdQbXcvYnRoVDBhQURGRlEvYXJ3TGRjdkxQM2t1WnE1T1
 UycWtDCk1oY1VydEZzMnYvRWxIZHNDdk45NGVURXpoRjZNK2tvSGk3TWo0WmhrbzZ3b3g4RE5oR
 GhZL0hjM0p6aWp0QU8KcVRSc2Q3aE82YlljcU1aUHFUMmNhRTdUMHBWN1RCeVhwcXF1QkZyN3kr
 NVUycnF5dEVDUUEraXQvaW96bGltRwozaVBtVGV4Ry8zb1B1a0RTcCtaT3RyR1pQWVNnTGRMVVU
 zTDFXTUp2aTlCdjVlUWN3WDczSzk1WU91MDc1OU54CkppRHI1dz09Cj1WdzU4Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: ZaujVxQJrOx2

From: Paolo Bonzini <pbonzini@redhat.com>

This is needed for Rust support.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                                |   2 +-
 python/scripts/vendor.py                   |   4 ++--
 python/wheels/meson-1.2.3-py3-none-any.whl | Bin 964928 -> 0 bytes
 python/wheels/meson-1.5.0-py3-none-any.whl | Bin 0 -> 959846 bytes
 pythondeps.toml                            |   2 +-
 tests/lcitool/mappings.yml                 |   2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 81ecd4bae7..7eb4b8a41c 100644
--- a/meson.build
+++ b/meson.build
@@ -1,4 +1,4 @@
-project('qemu', ['c'], meson_version: '>=1.1.0',
+project('qemu', ['c'], meson_version: '>=1.5.0',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
                           'b_staticpic=false', 'stdsplit=false', 'optimization=2', 'b_pie=true'],
         version: files('VERSION'))
diff --git a/python/scripts/vendor.py b/python/scripts/vendor.py
index 07aff97cca..0405e910b4 100755
--- a/python/scripts/vendor.py
+++ b/python/scripts/vendor.py
@@ -41,8 +41,8 @@ def main() -> int:
     parser.parse_args()
 
     packages = {
-        "meson==1.2.3":
-        "4533a43c34548edd1f63a276a42690fce15bde9409bcf20c4b8fa3d7e4d7cac1",
+        "meson==1.5.0":
+        "52b34f4903b882df52ad0d533146d4b992c018ea77399f825579737672ae7b20",
     }
 
     vendor_dir = Path(__file__, "..", "..", "wheels").resolve()
diff --git a/python/wheels/meson-1.2.3-py3-none-any.whl b/python/wheels/meson-1.2.3-py3-none-any.whl
deleted file mode 100644
index a8b84e5f11..0000000000
Binary files a/python/wheels/meson-1.2.3-py3-none-any.whl and /dev/null differ
diff --git a/python/wheels/meson-1.5.0-py3-none-any.whl b/python/wheels/meson-1.5.0-py3-none-any.whl
new file mode 100644
index 0000000000..c7edeb37ad
Binary files /dev/null and b/python/wheels/meson-1.5.0-py3-none-any.whl differ
diff --git a/pythondeps.toml b/pythondeps.toml
index f6e590fdd8..a1c6ca9662 100644
--- a/pythondeps.toml
+++ b/pythondeps.toml
@@ -19,7 +19,7 @@
 
 [meson]
 # The install key should match the version in python/wheels/
-meson = { accepted = ">=1.1.0", installed = "1.2.3", canary = "meson" }
+meson = { accepted = ">=1.5.0", installed = "1.5.0", canary = "meson" }
 
 [docs]
 # Please keep the installed versions in sync with docs/requirements.txt
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index 03b974ad02..9721016e0d 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -63,7 +63,7 @@ mappings:
 pypi_mappings:
   # Request more recent version
   meson:
-    default: meson==0.63.2
+    default: meson==1.5.0
 
   # Drop packages that need devel headers
   python3-numpy:

-- 
2.44.0
