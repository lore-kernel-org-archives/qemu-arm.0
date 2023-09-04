Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1446598ejb;
        Mon, 4 Sep 2023 09:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL/o7YzW+mjVmYeCrXfNnoIXB3kvpa2eEQQfflGHbqoHa/tD0X0+pshkFd+w0lvjQu298y
X-Received: by 2002:a05:620a:44c5:b0:76f:1614:577a with SMTP id y5-20020a05620a44c500b0076f1614577amr19110903qkp.5.1693844276029;
        Mon, 04 Sep 2023 09:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844276; cv=none;
        d=google.com; s=arc-20160816;
        b=uBcRg5SgNBf2eeC1tR9Y9uO+Ipubu7w6iWl64pRdv+Ya9N+/PY/Cj29FojMZlBQjJe
         NSCfkfV1NjXh6typD+uPE3lR3xF9K/Yhoe0EhQPEuX3feVCo975JiDOuU3ESvLy0K3lQ
         CeiNdjlq7CJApADjXjl7z/QIf6cs4W5WHgI1oSwt6yiTHOhOFi0GwFH6C9aU7ujn8ZUC
         J1IedYNb0nylelhNsZTXm8VT1KBIj15FVOnSvkGBXbBt1b3UGNfjLC50eLsRc4GuUd+m
         9k0Yq5sEsULZkvCE3Y1en8eEy32Kllw5SNaV1pbhWszKzNSW+NjFgBUw8ygbTrGxIA40
         J+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xGuryJTSyoRXnerBPgJM/pgbtWE/XseVwBkj0AvKIlk=;
        fh=yoeeTdiuJ4hfP62eFKx5QaPV8IKsa/Dl76YS7AWPRu0=;
        b=qkv1PByZaBJB4zUFg48PRzC19mhtE81qNdvFeLbj/2vBv6pCMxwg4JsqLCRr6oOV6+
         KmgIEWKmc/IiRwQKrNVn1CB6qwNuDUNhYWLzQerBIEmPEGzb1ylU9/vsv8mFIT70qmeL
         aZSgC99HMueaDg+4sTE5nAdO1Uv8kQh68uM4Q6zUCqBwqKDiWVZzlQhaDAh0DR2f4F8w
         Deghtdish8xrEZaOpDEjM8Qe/czCWBxpvHwfG0CZk+EUZypfXOnm/vZJcOraWRY4XJNX
         jQCHgCvu9D4BJDQu+hUqRC0UeZBPSiQXC7zXBTHPdJ8vqUD2r8C3G7D0zgKHw79o5Pwa
         JM5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCkTZhp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a29-20020a0cb35d000000b0064f51cd6991si6640205qvf.5.2023.09.04.09.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCkTZhp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCDN-0004TF-DJ; Mon, 04 Sep 2023 12:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDL-0004D4-9k
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:11 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDE-0007gy-F8
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:10 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso235630566b.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844043; x=1694448843; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGuryJTSyoRXnerBPgJM/pgbtWE/XseVwBkj0AvKIlk=;
 b=OCkTZhp+xySDAelll8iDajpzKieCmyBn+f+MwFFAxDyuvalX+IeUHRS80a+dwKlzd8
 J81sJnjEWByMdvS6ZWW05ZP2hmcxcgHB8T6YG9SfRDWMfUFSQ/VOAjKrkoDHlhHgZbaE
 /ccJ8wugRbePMIySRQm4vUaYmZb+mJJvYPBpkYUayIMSeWYALVWVaTK0oh1+biqZUmGn
 pKs66ALKLkyeGkYBfiT8ao7jxIWV9rq5TNnEuwrQ2kLsLEEgVP1uEnRX2jzL5bMctJpz
 MN8CoV0VyOAq6GnNsXoKBfOt82VzIWl/EJaAKWfMCCEEqNizLdSrc/KgWJo0YU88SSlk
 UV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844043; x=1694448843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGuryJTSyoRXnerBPgJM/pgbtWE/XseVwBkj0AvKIlk=;
 b=U1YwCAjfVk9x1Cew/xRL7uHqbbf30vWl022JJm+S5hk2CxIZyC0YMgSbW6RpLt63vR
 ak9zwMJA9//On+Huh+yDn++0oTttjRzysN4pGqoldNWaJzFMUn+cam3VSQCPgEGo9MD5
 9I65m7N59neKXcGhL69c/b6wCzjk/7wguoO74QGGdMvY6DvcgVJCqdvW83xICs2cuO2g
 kSpQ/mWPKvqiVAgoHloZjflf4Ocg2Tbbm0C6t+SkIP26JsarhlTRGNryILSMd2+Zeba+
 8rziRewIj6hLhbXtIRSRAubxr0upWTZyMiNqLfrmZjXcsy/QlVVOadbvB1FtlUV9HJyF
 0Ppw==
X-Gm-Message-State: AOJu0YxV/7IPJqiZ9pOC3LLOF0lGna4SEZsflhFvkoNB6Ixwg2W1LJtg
 E+cf/P3SU4KkYXRBA88dc2I5xq66eC/zTUS9RPw=
X-Received: by 2002:a17:906:8a41:b0:9a5:d657:47e5 with SMTP id
 gx1-20020a1709068a4100b009a5d65747e5mr7429251ejc.49.1693844043140; 
 Mon, 04 Sep 2023 09:14:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a1709067f8f00b009934855d8f1sm6371229ejr.34.2023.09.04.09.14.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:14:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 15/22] net/eth: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:27 +0200
Message-ID: <20230904161235.84651-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: PjX39WrlGtvJ

Fix:

  net/eth.c:435:20: error: declaration shadows a local variable [-Werror,-Wshadow]
            size_t input_size = iov_size(pkt, pkt_frags);
                   ^
  net/eth.c:413:16: note: previous declaration is here
        size_t input_size = iov_size(pkt, pkt_frags);
               ^

Suggested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 net/eth.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 649e66bb1f..3f680cc033 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -432,8 +432,6 @@ _eth_get_rss_ex_src_addr(const struct iovec *pkt, int pkt_frags,
         }
 
         if (opthdr.type == IP6_OPT_HOME) {
-            size_t input_size = iov_size(pkt, pkt_frags);
-
             if (input_size < opt_offset + sizeof(opthdr)) {
                 return false;
             }
-- 
2.41.0

