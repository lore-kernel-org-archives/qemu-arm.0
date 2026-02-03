Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C2EE87841
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 15:45:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnIZr-0005Ud-C2; Tue, 03 Feb 2026 10:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnIZq-0005TP-2w
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 10:44:30 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnIZn-0000sN-RM
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 10:44:29 -0500
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-64b7318f1b0so7970848a12.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 07:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770133466; x=1770738266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0WKU2JzX0ALasBma/VrQ27Ivs9nzG7RdqGlD0quZeY=;
 b=UBlulORluYWfSWk3wK4TmOxyjxh/5sktRo21meVcUrsEe3NQdmadBDirpme6BZHpfJ
 QLcb8hCys95688W5D7fz27diSoqlLhtSotlmQKBt5joNShmGsjAAQQCskq5Ttu2jSuFp
 4H4OqubJzCPgvLJu5Wfz1K/6WkwrRm7MrVbJiQputQkW0Mn86amH2cYlKSKmz/G7AuOm
 9N1wc316OHHp4vERNIQE6/YBnOs4CnYfeaNBNLF4S+j9hNEXUuowPeYjthgcZUiJ5mFQ
 PaGNoA4g5oRptaj9PJrekk+6XuuDSnZwUkVgLZyLWnvDm/C2tH1uiq0G2P09bI+4ZQiS
 jYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133466; x=1770738266;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q0WKU2JzX0ALasBma/VrQ27Ivs9nzG7RdqGlD0quZeY=;
 b=fA8JTnBG2h9DdcMiFfBWELypbzrsVUr0B7n1NglnZNND7DkAHM/IecFCPblHNOSzlk
 +6kHZ+PDwioU91Yx7XBEbVXUKu85DO5BoyaEVBErE8+re0iw9M2jBfiUVZrX30OXAgUl
 VBKtcgjxeA6UaGt9v8w5nsCVIFTugZg3aHk9A9FeT/QO+EpyssvZYqI8PcOdr50opBNp
 34rfMokKZjCJwBr9gBSHAz0nT0Nqzgr09w8w0o0gSnkW2T5+npjevneyWGuDg98JPSUB
 2torZnxJh7Gt5l9+9/cZB+ff/fAoSLPXFYMajwZ3EreIik70YD2G1Ksf1m4N7da+ftt7
 UiCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcO1GHrveB4YrG1JAPd9XOyqDSxgSoIVdVxaat0iqkzDfjMXevVuvv5PVRweLvFrqxZCbAaRGzgw==@nongnu.org
X-Gm-Message-State: AOJu0YyRJrG8uUeIRlNVAe3PKz4ZMcjTLOFyDbG/5J3QaGmst+65zVRi
 nQIOZZAnJhJT5FW7qMMApL7MzspW0GBzu5HzpMbRQhT4ElM1i4gL20WZ3vW4oQ7HFPQ=
X-Gm-Gg: AZuq6aJTHcl1+mtNYsv3PoWkqQAYGECMfzY9WS/DyUk9H/YxwcRILozIJU/teY6567u
 mKsRzhuAmUQvESF+zPRcOWCdWlZb0W1GQr+rGSU+mEiDHz53myLnk4dH+r4NjPDBo7uWikz9hcw
 BNl/aO/9/GJOIXniuBhB6I0dVYX5bmOc6Txgfj6U18DOhyx+CJ9v1vG1OtzVLUT5hov0LBkFhEe
 nMOoL/w/RyQvA17I3R8m3w2CNu941m+7rkBBqglVVgxn8Ezh8rTZQEXa/hGaGEe3uUxemHRwS4V
 0ARBHTDyuZyxxKi4BdM6yG29rERwsTTct7sW71zBltiBaTQlSow4hcFum2MlmdBwnvmRd8wjCkE
 oJGSob+I3ot+azZI02b2VkNh/PKRhkqo5tzIO5eU8oZQzvrDwyaQuP5RggjgIOV0hb7OXlfu7FW
 /Npd777Fnc68Q=
X-Received: by 2002:a17:907:6d27:b0:b87:4f80:f4ca with SMTP id
 a640c23a62f3a-b8dff899e3amr1004243466b.56.1770133465875; 
 Tue, 03 Feb 2026 07:44:25 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dd99188adsm923226166b.50.2026.02.03.07.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:44:25 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 248AE5F841;
 Tue, 03 Feb 2026 15:44:24 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  qemu-arm@nongnu.org,  Markus Armbruster
 <armbru@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson
 <david@gibson.dropbear.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,  qemu-ppc@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Cleber Rosa <crosa@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  qemu-s390x@nongnu.org,  Thomas Huth
 <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  David Hildenbrand <david@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 06/11] gdbstub: pass GString to gdb_build_stop_packet
In-Reply-To: <20260203115201.2387721-7-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Tue, 3 Feb 2026 11:51:56 +0000")
References: <20260203115201.2387721-1-alex.bennee@linaro.org>
 <20260203115201.2387721-7-alex.bennee@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Tue, 03 Feb 2026 15:44:24 +0000
Message-ID: <87ikcdomqv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The other functions we are going to clean-up work variously with there

their...

> own dynamically allocated GStrings or with the common shared buffer.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  gdbstub/internals.h | 5 ++++-
>  gdbstub/gdbstub.c   | 4 ++--
>  gdbstub/system.c    | 4 ++--
>  gdbstub/user.c      | 8 ++++----
>  4 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index 3134a6e8eb2..9b25bf58b8e 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -239,9 +239,12 @@ int gdb_target_memory_rw_debug(CPUState *cs, hwaddr =
addr,
>=20=20
>  /**
>   * gdb_build_stop_packet() - craft the stop packet
> + * @buf: GString buffer for building the packet
>   * @cs: CPUState
> + *
> + * Craft the Stop/Reply packet when we halt.
>   */
>=20=20
> -void gdb_build_stop_packet(CPUState *cs);
> +void gdb_build_stop_packet(GString *buf, CPUState *cs);
>=20=20
>  #endif /* GDBSTUB_INTERNALS_H */
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index c82fb5ad324..b45eb7c7b2b 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1432,7 +1432,7 @@ static void handle_v_attach(GArray *params, void *u=
ser_ctx)
>          gdbserver_state.c_cpu =3D cpu;
>=20=20
>          if (gdbserver_state.allow_stop_reply) {
> -            gdb_build_stop_packet(cpu);
> +            gdb_build_stop_packet(gdbserver_state.str_buf, cpu);
>              gdbserver_state.allow_stop_reply =3D false;
>          }
>      }
> @@ -2036,7 +2036,7 @@ static void handle_gen_set(GArray *params, void *us=
er_ctx)
>  static void handle_target_halt(GArray *params, void *user_ctx)
>  {
>      if (gdbserver_state.allow_stop_reply) {
> -        gdb_build_stop_packet(gdbserver_state.c_cpu);
> +        gdb_build_stop_packet(gdbserver_state.str_buf, gdbserver_state.c=
_cpu);
>          gdbserver_state.allow_stop_reply =3D false;
>          gdb_put_strbuf();
>      }
> diff --git a/gdbstub/system.c b/gdbstub/system.c
> index 6963c930b01..8ec8b7ea336 100644
> --- a/gdbstub/system.c
> +++ b/gdbstub/system.c
> @@ -668,8 +668,8 @@ void gdb_breakpoint_remove_all(CPUState *cs)
>   *   T05core:{id};
>   */
>=20=20
> -void gdb_build_stop_packet(CPUState *cs)
> +void gdb_build_stop_packet(GString *buf, CPUState *cs)
>  {
> -    g_string_printf(gdbserver_state.str_buf,
> +    g_string_printf(buf,
>                      "T%02xcore:%02x;", GDB_SIGNAL_TRAP, gdb_get_cpu_inde=
x(cs));
>  }
> diff --git a/gdbstub/user.c b/gdbstub/user.c
> index c7a3ef947ed..a16f37616b1 100644
> --- a/gdbstub/user.c
> +++ b/gdbstub/user.c
> @@ -976,9 +976,9 @@ void gdb_handle_query_xfer_siginfo(GArray *params, vo=
id *user_ctx)
>   *   T05thread:{id};
>   */
>=20=20
> -void gdb_build_stop_packet(CPUState *cs)
> +void gdb_build_stop_packet(GString *buf, CPUState *cs)
>  {
> -    g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIGNAL_=
TRAP);
> -    gdb_append_thread_id(cs, gdbserver_state.str_buf);
> -    g_string_append_c(gdbserver_state.str_buf, ';');
> +    g_string_printf(buf, "T%02xthread:", GDB_SIGNAL_TRAP);
> +    gdb_append_thread_id(cs, buf);
> +    g_string_append_c(buf, ';');
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

