Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3691627lfb;
        Mon, 23 Nov 2020 07:30:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl8GA5ysXnA5NFOBvylO8WFe6s619S18zYV0GDPm+t/THyAlWNt4iDlCdvxTw56b5lPZ3c
X-Received: by 2002:a25:fc01:: with SMTP id v1mr43449029ybd.241.1606145437948;
        Mon, 23 Nov 2020 07:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606145437; cv=none;
        d=google.com; s=arc-20160816;
        b=mTY0o0Q4lm3QmmuLmpv6tCmQZeZ5XcP2xdE6gxa3ZYptWgIcbsNBWFuFUgshqvFCmN
         CNlEOFh7BSrjwTZ1B+t/lIfWPBzv/8j/jKNjZoYLOgRBDXEK1e8c2yHO66yQ5uLcoUwW
         6rZj8s4w0DXXSjeA+GT2tCiLMiEPaSdo4W62/6wKcKEHPZAzrhfk8Iywd1Vv7GeYQ2is
         R9Sdz57mW8lBw2HHZ043foFH+Tv2JXwZmJi9xXyI6Fh8S5e93bBOnFmJwK1OkafOzfIt
         2fdiulscQTcxA343TOTiAx1MNxTMgzMDGuQyeJdWxcK6sAcTnnBXXbOuObkR6bO8rkkV
         D8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iyv/pNUPsdbaODe8oiXn7yzP0vhtydh/iG9hDqFfhSc=;
        b=AeAsdWgB2w3BLwLx0gvjWF9dsWTzHF+HEK6XFBLifWCEt26QMUIStU6HH1S+2W2QHN
         VNW5b9vffc45oRk4eDQrPIf9REJQXpz5N7nS8aJepCeQQoSnxLmfRawfI5RqnzllogHl
         8IlGwewyzbO3VVwRQjp17TijtOXPH2TPSETQzE+N7R5J+D5Doc3E+btSsWp/wvDXcgd4
         BUQxWf+wWRsqSnAXE6jYmvkQ3eJsV3RL71r3BE0WzfS/9XlXgouAw4T3qLOiIfg/rChj
         8ecp43PIXPqItJs/4DvrA9YbBEMrGIlJ/T9IFR5Xb0Chqi6UZQOit0NrHa7UJ0HjUKRI
         ox7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ebzFCGy7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si11897163ybb.235.2020.11.23.07.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 07:30:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ebzFCGy7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khDnZ-0005qw-Ay
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 10:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1khDnA-0005pk-K2
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:30:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1khDn8-00029X-V8
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606145410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyv/pNUPsdbaODe8oiXn7yzP0vhtydh/iG9hDqFfhSc=;
 b=ebzFCGy7GnwfE871O5oZAukHwAlJ/1PWoxV++NJMGgSXSYcNeDES/+cDV70BEV25g0M40J
 gyQlXaRd8TfVGs1LnSke6VtJJKNqCE7KkNbyTWa3uRyaGagz4QES483Kmg9f8qzKR9fO7y
 aO+5zLIofouzCUbUBRu0Gzh3pbsbU24=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-D1zwCzklMsag1diuMoJjww-1; Mon, 23 Nov 2020 10:30:06 -0500
X-MC-Unique: D1zwCzklMsag1diuMoJjww-1
Received: by mail-vk1-f199.google.com with SMTP id h67so8194439vke.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 07:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iyv/pNUPsdbaODe8oiXn7yzP0vhtydh/iG9hDqFfhSc=;
 b=ewFcSXxc1RQ4DOsM/3KsrxQcmEy40uvSJYgbTC1mVre24Pq4C7Sc2UTIhWaURyoJEL
 01a8KttTbIKJX8w/Rchb6h90wAkWsNfkQX+mJ4mz+/5I57GISNQgE8Xo0OYcth+FQrWb
 y+UTPHxgmHG+4UoX00g53ky1txNad8Vh6fVS+hSFTG49I3Bm5wcBgCqdO1Gk9dKND5S5
 cjChPBGJRvuGJZhghAPQ6PqYVrRpJdFFmVJxQzsqwB4fU239ZJKHHZLK8QUOtnZFMvly
 Y18WQlJJ0ZLAGFeJ6pi9fyCQIVmoayXZnPiBdcZdR7qqCYZ7uP/mCXDZ9KseOrApUsbm
 vtbQ==
X-Gm-Message-State: AOAM5304Wnld1WuFicAePNlcR6YEJGjVqMbDmgGgBMipllbv96FH0bHF
 RNUNRW03BBX1ZpN2UwRQX0p/GvzZwc0wL4tgNA0H9vLev29qYata3wWK/TJPjMRlGUnA8Gr6iwH
 s/QM+/PHTmwGtM5FYMLF9JOAY2n62yAA=
X-Received: by 2002:a1f:1c92:: with SMTP id c140mr288717vkc.7.1606145405328;
 Mon, 23 Nov 2020 07:30:05 -0800 (PST)
X-Received: by 2002:a1f:1c92:: with SMTP id c140mr288698vkc.7.1606145405123;
 Mon, 23 Nov 2020 07:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-2-philmd@redhat.com>
In-Reply-To: <20201102144245.2134077-2-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 23 Nov 2020 12:29:53 -0300
Message-ID: <CAKJDGDaT0TonREayqwWs8CBfEv+35KCFUw6rG3NXGosrZHRRdQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 1/5] tests/acceptance: Restrict
 virtio_check_params tests to X86 target
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DA9ZDWrS5KEL

On Mon, Nov 2, 2020 at 11:45 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We disabled the virtio_check_params tests in commit 2d6a6e238a2
> ("tests/acceptance/virtio_check_params: Disable the test"),
> because these tests were making multiarch CI fail (virtio is
> multiarch).
>
> We took the big hammer, as we can restrict the tests to the X86
> arch. Restore them on this single arch.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/acceptance/virtio_check_params.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/v=
irtio_check_params.py
> index 87e6c839d14..fecf1c094b1 100644
> --- a/tests/acceptance/virtio_check_params.py
> +++ b/tests/acceptance/virtio_check_params.py
> @@ -42,6 +42,12 @@
>
>
>  class VirtioMaxSegSettingsCheck(Test):
> +    """
> +    This test should be multi-arch, however only X86 is implemented.
> +
> +    :avocado: tags=3Darch:x86_64
> +    """
> +
>      @staticmethod
>      def make_pattern(props):
>          pattern_items =3D ['{0} =3D \w+'.format(prop) for prop in props]
> @@ -117,7 +123,6 @@ def seg_max_adjust_enabled(mt):
>              return True
>          return False
>
> -    @skip("break multi-arch CI")
>      def test_machine_types(self):
>          # collect all machine types except 'none', 'isapc', 'microvm'
>          with QEMUMachine(self.qemu_bin) as vm:
> --
> 2.26.2
>
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

