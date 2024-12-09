Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2794008njb;
        Mon, 9 Dec 2024 10:31:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaJeyLnC87SJD2WKRgI6EMSq0ZAzwpLim9ijFCikIExp5RtbuMyKkkao3rk1VLAad4biLSwiDiVtuREg==@linaro.org
X-Received: by 2002:a05:6a00:1403:b0:725:9f02:4899 with SMTP id d2e1a72fcca58-725b81f25e2mr19446123b3a.22.1733769068209;
        Mon, 09 Dec 2024 10:31:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733769068; cv=none;
        d=google.com; s=arc-20240605;
        b=idjOCUtQkAdxceDFtX+YLsi7ilrJ5DFUcDNf5boROIgj1wVOyVvKxvMcK1IUY8FT+W
         3XKGiUlgyPJsjBdbl+6++yOvPdqnFwQxx1RwVCc898dlmyYhDuC8CleWK5+plUoG35EG
         p6NzNHN9yoMmIfTm5kLq3FYvGHrR8NP7BpWgJkrcq4dgl8OL+mXEo0L3vwSalR64DSP4
         V2Lg9cvX3AJLIeYPxfQG0J1ts7cinFRUAGtghroyEO9OvTJ16LQh5VA2vxeCCN7aYY/M
         UTHClYrYk+hbQUIm2txB8Ftri4p9qqv5e25RIaXVYueT5FesNuJ6XSaQenYkFLmsqGBL
         n6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=PZqZBHwarWuFysN6iWztZx7iVOB2C8528xQYw/i/7uM=;
        fh=ha6BdIbbLTEDnBWYalOMB4sJ/2ML9eaF9IF9jLDr+tw=;
        b=Bbp1H7uJIpqte36rX3XgW0GmCVHGUqKwtlLTYP+Zvpd6cK73NhDjeEZKtm9eRl3u0X
         wt3MaV1mTqve/bdlrnaHX6vCUBkSg6km5xqsiBlhaLaSd/XcYhACUVkICGPVVwcZ6Xb/
         zINxfvEYXnfZL3RHVNLap/wHJh7K3eN3is5XOYPI0VEnEjCgunFFfeMO+37uxlxGhITE
         d5Z+sgPig2FP19c58WuLkMIU/vHM4FLTe/yG5kdJVszyWhpz8x35+lkfMidxGVYOh6EX
         lWbheXu8I2b6Bx0Y+16H62EuDL9Bm4qM7gLiHG5bFXS79l1SrpU2f8UBg+0q35vxw43t
         4v1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AYXL2P/J";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725a2a101fcsor6044496b3a.1.2024.12.09.10.31.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Dec 2024 10:31:08 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AYXL2P/J";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733769068; x=1734373868; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZqZBHwarWuFysN6iWztZx7iVOB2C8528xQYw/i/7uM=;
        b=AYXL2P/JJtsubwJBQlMT6kRe8DRSUFgg+1uKvxOgHARe+OrieLrHh+YRXOmvjO3Vgi
         7uOmj+ctrVC5qkOUTOfL6tZPsHZO0W7a+NTJvynPjRL8pR1u29PkBfeZgBGwmoJWNhy+
         oSyLJDbs+8pX0MHd2xwjDKoHmsyeRouuDUhdDFrNq+rAyn0e8avXlGCHGxCMmZDWJ2RK
         unSzo1lyW3Y+QQ+0wF3+3Mi+XA+XDvAtr2fXXqbqzFwfLTGwWiY07LGWi7/tv08b/GCc
         qNqEII7Ay0sfEAtvJ6BngXV0CXPxqj7/1DlaUARxVyK294U1RV9PnqscYJpd0+Vwj6Uo
         4JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769068; x=1734373868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZqZBHwarWuFysN6iWztZx7iVOB2C8528xQYw/i/7uM=;
        b=bMd/b1FH+5uMoZ3fst7KDnum6E8mNmTj2BHyP6VArqPAsi64+B9Biyrl3IvZ95t2eM
         q8BauQNrNHJw50fWnv+d1aSeVcYPukWnoadw+/VcDQjxeXxIV55tdpYwhC5xyZSquX4w
         oyid3QYw7fYCIe5K/lQs0FJHYDd3t1v/uEbbN5tGzSidtwVvkBaeoDOvz574zfUyBPiG
         2aHCDn+X6Uwc2p/7wMxNeSMIHiSOiUlhGMBwSIFG0q4nIT9TQDfdd4OxofFLOd+ND5ma
         eDDyO9qMyVnF5/4iHtmN8zniLFwN45tra49UHsdojFKhUYjJvxEQvYyzKCDMUc+M/O9k
         q+CA==
X-Forwarded-Encrypted: i=1; AJvYcCUrwxCd2HS/BB3hBXrsAASns2Tchif9F38gmVnIuW3VdKriqYUVIfsYk0U1vDzd3PwtQUtlhtG4d2W6Nw==@linaro.org
X-Gm-Message-State: AOJu0YyShPjuCIQEP0Uq6rOzfpKZWD3haHmLU54AX4LycfNinX7RTZhR
	y4GgacLY3Plt/eMRkwn1v+YXxBIegSlF8a4gFWzY9Sq4ewuMihKYlLAzgWxLFYgjng==
X-Gm-Gg: ASbGncs+9+ZBaqnSCQdRfQGqyFbNaw5blf2G2IdtPjSGyiet88MgAVLI/d3vcKoMEb5
	sRoCOY11zJPgf4WXu5rhRNT9FCYXBI15vwv5QsPfvUjtEbvxICKFyi5rIbD0Norz8tTB9HrBBZD
	xwS+eRgbCXpct/IE9HLBoXu6GxnT9D6zItvqrmh53VX+qnOmUHwidIVKIBbJcTnihbVlb3kbQtv
	K9IX5gmZmv6PC+KPgbO3j16yBYUuW4xk5k+9WFn+/4WCKLhJfwmzUD6YfmKCsoYK5sP5Ub6xmFd
	90B3DVJm
X-Google-Smtp-Source: AGHT+IFpHUUfQEGoFuUDLNn5zxgwOTzLoQsIq3M53PXqhUwrAI2CmruVHac2HmDdLItmBcpygAm3eA==
X-Received: by 2002:a05:6a00:2d0b:b0:724:6cd2:cdcf with SMTP id d2e1a72fcca58-725b81f2d33mr20069380b3a.24.1733769067681;
        Mon, 09 Dec 2024 10:31:07 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e2388d37sm3322821b3a.73.2024.12.09.10.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 10:31:07 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	qemu-block@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	philmd@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Markus Armbruster <armbru@redhat.com>,
	gustavo.romero@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 0/6] Enhance documentation for new developers
Date: Mon,  9 Dec 2024 10:30:58 -0800
Message-Id: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WvYGdGSmVtcv

This series extends our documentation with new pages to help developers
onboarding on QEMU. It focuses on providing a big picture of QEMU (to a
modest extend).

As such, it was written to be simple, short, easy to understand, and pointing to
more details. It provides another way to dive into details instead of simply
hitting the "search" box.

The first patches enhance the existing developer section. They provide
information about b4 and git-publish, two important tools that I learnt from my
coworkers, and were not presented anywhere, and were really missing IMHO.

Then, we introduce a new Codebase page, presenting (succintly) the various parts
of QEMU, and what every folder of the codebase contains.
We then add a glossary with the most recurrent acronyms we hear in our daily
conversations on the mailing list.
Finally, we add an "How-to" page which present how to build and test qemu, and
how to contribute a patch. It's definitely a repetition of existing information,
but the goal was to have a self contained page with all the commands I run
daily personally, and that someone would be interested to have.

When reviewing, please keep in mind this is targeting someone who discovers
QEMU, and not someone who contributed to the project for several years. What is
obvious for you will not be obvious for a random young developer.

That said, please free to point if something is "false", or "really incomplete".
It can be hard to summarize in one or two sentences complex parts, but that's
the intent here.

Your feedback on content or organization is very welcome!

Thanks,
Pierrick

v2:
- removed how-to section
- integrated all suggestions from Daniel and Peter (thanks for all your comments)
- Note: build environment keeps mentioning windows-arm64 because we solved the
  issue with gcc_struct attribute. The related series will be merged before this
  documentation.

v3:
- added a comment about git-publish asked by Daniel.

v4:
- add suggestion from Thomas for codebase and message-id.

Pierrick Bouvier (6):
  docs/devel: remove dead video link for sourcehut submit process
  docs/devel: add git-publish for patch submitting
  docs/devel: add b4 for patch retrieval
  docs/devel: add information on how to setup build environments
  docs: add a codebase section
  docs: add a glossary

 docs/about/build-platforms.rst         |   4 +-
 docs/about/emulation.rst               |   2 +
 docs/devel/build-environment.rst       | 118 +++++++++++
 docs/devel/codebase.rst                | 220 +++++++++++++++++++
 docs/devel/control-flow-integrity.rst  |   2 +
 docs/devel/decodetree.rst              |   2 +
 docs/devel/ebpf_rss.rst                |   2 +
 docs/devel/index-build.rst             |   1 +
 docs/devel/index-internals.rst         |   2 +
 docs/devel/index.rst                   |   1 +
 docs/devel/migration/main.rst          |   2 +
 docs/devel/multi-thread-tcg.rst        |   2 +
 docs/devel/qapi-code-gen.rst           |   1 +
 docs/devel/submitting-a-patch.rst      |  44 +++-
 docs/devel/testing/main.rst            |   9 +-
 docs/devel/testing/qtest.rst           |   2 +
 docs/glossary.rst                      | 280 +++++++++++++++++++++++++
 docs/index.rst                         |   3 +
 docs/interop/qemu-ga.rst               |   2 +
 docs/system/arm/virt.rst               |   2 +
 docs/system/images.rst                 |   2 +
 docs/system/qemu-block-drivers.rst.inc |   2 +
 docs/tools/qemu-nbd.rst                |   2 +
 docs/tools/qemu-storage-daemon.rst     |   2 +
 docs/user/main.rst                     |   6 +
 25 files changed, 709 insertions(+), 6 deletions(-)
 create mode 100644 docs/devel/build-environment.rst
 create mode 100644 docs/devel/codebase.rst
 create mode 100644 docs/glossary.rst

-- 
2.39.5
