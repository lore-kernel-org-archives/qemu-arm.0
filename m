Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp742641lff;
        Fri, 6 Aug 2021 16:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvVJHhios1VNes2geUs56juw2jFC8ZILGLdHNkrZEYIkqKhgudpRzKob2FfaHNejCM+DOt
X-Received: by 2002:a05:6e02:54c:: with SMTP id i12mr1027330ils.103.1628293790016;
        Fri, 06 Aug 2021 16:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628293790; cv=none;
        d=google.com; s=arc-20160816;
        b=gvcK7402t9tk6t1u/81YTbgOj68YZfI0V2j/1UP188Htv1T3zznRenohrJrHG2E8Tr
         dTC99cfJkSUvj+s1WkkBpfpxXyqn3i1budnnyMydUeagLJJJZTzct1gV4DGD3FcDM++b
         qxChNeo5l1KDqLc4VvEpM7I/+Qxob63i9YUej8964XuBeMx0R0XOFNSOagNRuDdqXa1S
         zFXOpwiAM8dCj47YbL4XUN9mz4xSctbuuKP071j8+k1rog2BpTwHbldiiOYK/fKUD1r3
         uZvzVrgy9hpn0E9iBNktX8XNmrKsLv4WCCGXPcLLxmauGy3jymE5AGEk888e/uzBzIoI
         J+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=XqtZouX1dsK0xt45rvjPAiwNwuBYfTyHPKY1ulqPTHQ=;
        b=oLRcJi50/I6wefFqgOlD75sWznBssN1aEgkAl7gJIqvB+YiyaOINh8cWlpLK8ebFD0
         P2zaYKDwdByIPwNZZrm9cgkGz8IZetvPY71SPl2DkXDla4XI3otLFph4oFvk+l7gimPm
         VETtvMShl2l7uZ9p3JpZ80cgl2JtQPSCkLl1XrrszZzssqFz0bwP2XSofAn8xlTnxgXB
         G/q4y7LnuPQronuiZxNcGAp4aj1gjftlzs0c8ufPrL3rnedS8oq5yGmww7+4fKZa78NZ
         LRYiY0/H1Mwtsy10bNwugJ2e5ql4XXFrqtE2bG9ZEEmlxR4IeqC//jQ0za3K+J83dVpX
         XZgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=IxYduGmb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si11308371ilm.64.2021.08.06.16.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 16:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=IxYduGmb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mC9b3-0005ts-BP
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 19:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gsoNYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mC9ag-0005Lw-3E
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 19:49:26 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:33383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gsoNYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mC9ad-0002st-Oe
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 19:49:25 -0400
Received: by mail-qk1-x749.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so7512391qkd.0
 for <qemu-arm@nongnu.org>; Fri, 06 Aug 2021 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XqtZouX1dsK0xt45rvjPAiwNwuBYfTyHPKY1ulqPTHQ=;
 b=IxYduGmb/iRg2VKUziNtsrYOhCUqJ/g/WsB1BWUCEoiHskwJpxuWWYRzmJuyA5RApz
 r+dFXdZSOW4J0T7xxWgSf+sd0/CEUc6Fkw0K5xmFKQkmVS7lRSoXxaR6r592M1qjWuMV
 tNmyu0MBjRzORnNOus8NgRCmGo41mDplm7icx8/vfpPELjArnJzUXwN1mE2Rsh6GvNgO
 saNn41p/MRpKf4WWor9MAm5NVJk24OpCCoA2NO6z40i6k9TxIH3LC2C5gaD81F3onzVG
 zZuqlypernJBI+P05G7R32iZEfx6d39EWGPgEhTw/2cgxmYfOFRXa30NBY4hzFx3+h0y
 gRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XqtZouX1dsK0xt45rvjPAiwNwuBYfTyHPKY1ulqPTHQ=;
 b=f9u5jXINHlno/yzAJ1+KJp7hb+Gph/DeVz6bOpS3g4R6x369kyAuqEje7m5FbkkE0k
 KL6RYdXmI2JjUPsOE6X4kQjX/ag+rtJagQO1qhKDhfYg9wHakqJqhshGhauch90SCXNH
 FrvGsl4Doml7XEONWmE1iwbaYNecjl0LPs6OhtiLM5wM6KBfibDtfFnuz/gv6s07R9zn
 hmBK7Hku+ja/JA+wnY9q6MvsdU/sZSREOR+igBJ/lOhaqxuhd/nH874QsX8dxtasbtIb
 HZHLWZFHki2xhgmyXUesINtouvdjnK/h28s1wf57jrRuWsMOyfxGlQ+Gi9ANAPMfZQFH
 Tcvg==
X-Gm-Message-State: AOAM532mAWTJGJ4wAbd5iW2RbYssiegO9Aays4OspMlcDWq/KwcD49Ye
 pWl9WUNEX0Ulpli24oYm/fb3GYMlbA==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:226b:: with SMTP id
 gs11mr191005qvb.36.1628293762886; Fri, 06 Aug 2021 16:49:22 -0700 (PDT)
Date: Fri,  6 Aug 2021 23:49:18 +0000
In-Reply-To: <20210806234918.122457-1-stmao@google.com>
Message-Id: <20210806234918.122457-3-stmao@google.com>
Mime-Version: 1.0
References: <20210806234918.122457-1-stmao@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v4 2/2] docs/specs: add remote i2c docs
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, venture@google.com, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3gsoNYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D6mpZiw8bh59

Change-Id: I4ef1e31c326dbb4f741bf65d9212ff10fc3c98c3
---
 docs/specs/index.rst      |  1 +
 docs/specs/remote-i2c.rst | 51 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 docs/specs/remote-i2c.rst

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index b7b08ea30d..ac496fb8b8 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -13,3 +13,4 @@ guest hardware that is specific to QEMU.
    acpi_hw_reduced_hotplug
    tpm
    acpi_hest_ghes
+   remote-i2c
diff --git a/docs/specs/remote-i2c.rst b/docs/specs/remote-i2c.rst
new file mode 100644
index 0000000000..7f3b1e46bb
--- /dev/null
+++ b/docs/specs/remote-i2c.rst
@@ -0,0 +1,51 @@
+=================
+Remote I2C Device
+=================
+
+The remote I2C device is connected directly to the I2C controller inside QEMU,
+and the external I2C device is outside of QEMU. The communication between the
+external and remote I2C devices is done through the character device provided
+by QEMU and follows the remote I2C protocol.
+
+Remote I2C Protocol
+===================
+The remote I2C device implements three functions of the struct I2CSlaveClass:
+
+* event
+* recv
+* send
+
+Exactly one byte is written or read from the character device at a time,
+so these functions may read/write to the character device multiple times.
+Each byte may be a command or a data byte. The command are outlined
+in enum RemoteI2CCommand. The protocol describes the expected behavior
+of the external I2C device in response to the the commands.
+
+event
+=====
+A subset of the RemoteI2CCommand corresponds exactly to the enum i2c_event.
+They are:
+
+* REMOTE_I2C_START_RECV
+* REMOTE_I2C_START_SEND
+* REMOTE_I2C_FINISH
+* REMOTE_I2C_NACK
+
+The event function of remote I2C writes the command to the external I2C device.
+The external device should call its event function to process the command as
+an event and write back the return value to remote I2C. This value is then
+returned by the event function of remote I2C.
+
+recv
+====
+The recv function of remote I2C writes the RemoteI2CCommand REMOTE_I2C_RECV to
+the external I2C device. The external device should call its recv function
+and write back the return value to remote I2C. This value is then returned by
+the recv function of remote I2C.
+
+send
+====
+The send function of remote I2C writes the RemoteI2CCommand REMOTE_I2C_SEND
+followed by the data to the external I2C device. The external device should
+call its send function to process the data and write the return value back to
+remote I2C. This value is then returned by the send function of remote I2C.
-- 
2.32.0.605.g8dce9f2422-goog

